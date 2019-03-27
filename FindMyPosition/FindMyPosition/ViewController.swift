//
//  ViewController.swift
//  FindMyPosition
//
//  Created by Ternence on 2019/2/20.
//  Copyright © 2019 Ternence. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let locationLabel = UILabel()
    let locationStrLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = UIImage.init(named: "phoneBg")
        self.view.addSubview(bgImageView)
        
        let blurEffect: UIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView:UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)
        
        locationManager.delegate = self
        
        locationLabel.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width, height: 100)
        locationLabel.textColor = UIColor.white
        locationLabel.textAlignment = NSTextAlignment.center
        locationLabel.numberOfLines = 0
        self.view.addSubview(locationLabel)
        
        locationStrLabel.frame = CGRect(x: 0, y: 200, width: self.view.bounds.width, height: 100)
        locationStrLabel.textAlignment = NSTextAlignment.center
        locationStrLabel.textColor = UIColor.white
        locationStrLabel.numberOfLines = 0
        self.view.addSubview(locationStrLabel)
        
        let findMyLocationBtn = UIButton(type: UIButton.ButtonType.custom)
        findMyLocationBtn.frame = CGRect(x: 50, y: 350, width: self.view.bounds.width - 100, height: 50)
        findMyLocationBtn.setTitle("Find My Location", for: UIControl.State.normal)
        findMyLocationBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        findMyLocationBtn.addTarget(self, action: #selector(findMyLocation), for: UIControl.Event.touchUpInside)
        self.view.addSubview(findMyLocationBtn)
    }
    
    @objc func findMyLocation(){
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    @objc func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations: NSArray = locations as NSArray
        let currentLocation = locations.lastObject as! CLLocation
        let locationStr = "lat:\(currentLocation.coordinate.latitude) lng:\(currentLocation.coordinate.longitude)"
        
        locationLabel.text = locationStr
        
        reverseGeocode(location: currentLocation)
        locationManager.stopUpdatingLocation()
    }
    
    @objc func reverseGeocode(location:CLLocation){
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if error == nil{
                let tempArray = placeMark! as NSArray
                let mark = tempArray.firstObject as! CLPlacemark
                
                let countryStr = mark.country! as String
                let cityStr = mark.locality! as String
                let StreetStr = mark.thoroughfare! as String
                
                let finalAddress = "\(countryStr) \(cityStr) \(StreetStr)"
                
                self.locationStrLabel.text = finalAddress
    
            }
        }
    }
    

}

