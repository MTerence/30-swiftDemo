//
//  VideoSplashViewController.swift
//  VideoSplash
//
//  Created by Ternence on 2019/2/25.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingModel {
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

public class VideoSplashViewController: UIViewController {
    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel:Float = 1.0
    public var contentURL:NSURL = NSURL() {
        didSet {
            setMoviePlayer(url:contentURL)
        }
    }
    
    public var videoFrame:CGRect = CGRect()
    public var startTime:CGFloat = 0.0
    public var duration:CGFloat = 0.0
    public var backgroundColor:UIColor = UIColor.black{
        didSet{
            view.backgroundColor = backgroundColor
        }
    }
    
    public var sound:Bool = true{
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    public var alpha:CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    
    public var alwaysRepeat:Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    public var fillModel:ScalingModel = .ResizeAspectFill{
        didSet {
            switch fillModel {
            case .Resize:
                moviePlayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resize.rawValue)
                
            case .ResizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspect.rawValue)
                
            case .ResizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)
            }
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setMoviePlayer(url:NSURL){
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) in
            if let path = videoPath as NSURL? {
                self.moviePlayer.player = AVPlayer(url: path as URL)
                self.moviePlayer.player?.play()
                self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
            }
        }
    }
    
    @objc func playerItemDidReachEnd(){
        moviePlayer.player?.seek(to: CMTime.zero)
        moviePlayer.player?.play()
    }
}

