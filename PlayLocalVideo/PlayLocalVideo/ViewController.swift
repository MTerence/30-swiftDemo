//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Ternence on 2019/2/21.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class ViewController: UIViewController,AVAudioPlayerDelegate {
    var audioPlayer:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videoButton = UIButton()
        videoButton.setTitle("play Video", for: UIControl.State.normal)
        videoButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        videoButton.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        videoButton.addTarget(self, action: #selector(playVideo), for: UIControl.Event.touchUpInside)
        self.view.addSubview(videoButton)
        
        let audioPlayButton = UIButton()
        audioPlayButton.setTitleColor(UIColor.red, for: UIControl.State.normal)
        audioPlayButton.setTitle("play audio", for: UIControl.State.normal)
        audioPlayButton.frame = CGRect(x: 50, y: 150, width: 100, height: 50)
        audioPlayButton.addTarget(self, action: #selector(playAudio), for: UIControl.Event.touchUpInside)
        self.view.addSubview(audioPlayButton)
        
        let audioPauseButton = UIButton()
        audioPauseButton.setTitle("pause Audio", for: UIControl.State.normal)
        audioPauseButton.setTitleColor(UIColor.red, for: UIControl.State.normal)
        audioPauseButton.frame = CGRect(x: 50, y: 250, width: 100, height: 50)
        audioPauseButton.addTarget(self, action: #selector(pauseAudio), for: UIControl.Event.touchUpInside)
        self.view.addSubview(audioPauseButton)
        
        initAudio()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        initForLockScreen()
    }

    @objc func playVideo(){
        let videoUrl = URL(string: "http://down.treney.com/mov/test.mp4")
        let player = AVPlayer(url: videoUrl!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.present(playerController, animated: true) {}
    }
    
    @objc func playAudio(){
        audioPlayer.play()
    }
    
    @objc func pauseAudio(){
        audioPlayer.pause()
    }
    
    func initAudio(){
        let audioPath = Bundle.main.path(forResource: "live", ofType: "mp3")
        let audioUrl = URL(fileURLWithPath: audioPath!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        }
        catch{
            audioPlayer = nil
        }
        
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.videoRecording, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

            try AVAudioSession.sharedInstance().setActive(Bool.init(), options: AVAudioSession.SetActiveOptions.ArrayLiteralElement)
            try AVAudioSession.sharedInstance().setActive(Bool.init(true), options: AVAudioSession.SetActiveOptions.Element)

        }catch{
            print("error...")
        }
    }
        
    func initForLockScreen(){
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle:"平凡之路",
            MPMediaItemPropertyArtist:"朴树",
            
            MPMediaItemPropertyArtwork:MPMediaItemArtwork(boundsSize: CGSize(width: 80, height: 80), requestHandler: { (CGSize) -> UIImage in
                    return UIImage.init(named: "thumb.jpg")!
            }),
            
            MPNowPlayingInfoPropertyPlaybackRate:1.0,
            MPMediaItemPropertyPlaybackDuration:audioPlayer.currentTime
        ]
    }
    

    override func remoteControlReceived(with event: UIEvent?) {
        switch event!.subtype {
        case .remoteControlPlay:
            audioPlayer.play()
            
        case .remoteControlPause:
            audioPlayer.pause()
            
        case .remoteControlStop:
            audioPlayer.stop()
            
        default:
            break
        }
    }

}

