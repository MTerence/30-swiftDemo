//
//  CenterViewController.swift
//  SnapChatLikeApp
//
//  Created by Ternence on 2019/3/5.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import AVFoundation

class CenterViewController: UIViewController,AVCapturePhotoCaptureDelegate {

    var imageView:UIImageView!
    var captureSession:AVCaptureSession!
    var stillImageOutput:AVCapturePhotoOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        self.imageView = UIImageView(frame: self.view.bounds)
        self.view.addSubview(self.imageView)
        
        let captureButton = UIButton()
        captureButton.frame.size = CGSize(width: 48, height: 48)
        captureButton.center.x = self.view.center.x
        captureButton.frame.origin.y = self.view.frame.height - 100
        captureButton.setImage(#imageLiteral(resourceName: "takePhoto"), for: UIControl.State.normal)
        captureButton.addTarget(self, action: #selector(takePhoto(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(captureButton)
        
        let device = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: AVMediaType.video, position: AVCaptureDevice.Position.back)
        do {
            let input = try AVCaptureDeviceInput(device: device!)
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
                stillImageOutput = AVCapturePhotoOutput()
                
                if captureSession.canAddOutput(stillImageOutput){
                    captureSession.addOutput(stillImageOutput)
                    
                    let captureVideoLayer : AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
                    captureVideoLayer.frame = self.imageView.bounds
                    captureVideoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                    self.imageView.layer.addSublayer(captureVideoLayer)
                    
                    captureSession.startRunning()
                    
                }
            }
            
        }
        
        catch {
            print(error)
        }
        
    }
    
    @objc func takePhoto (_ sender: Any){
        DispatchQueue.main.async {[unowned self] in
            self.view.layer.opacity = 0
            UIView.animate(withDuration: 0.25, animations: {
                self.view.layer.opacity = 1
            })
        }
        
        let settingsForMonitoring = AVCapturePhotoSettings()
        settingsForMonitoring.flashMode = AVCaptureDevice.FlashMode.auto
        settingsForMonitoring.isAutoStillImageStabilizationEnabled = false
        settingsForMonitoring.isHighResolutionPhotoEnabled = false
        stillImageOutput.capturePhoto(with: settingsForMonitoring, delegate: self)
    }
    
    
    //MARK: - AVCapturePhotoCaptureDelegate
    func photoOutput(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        if let photoSampleBuffer = photoSampleBuffer {
            let photoData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer)
            let image = UIImage(data: photoData!)
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }
    }

}
