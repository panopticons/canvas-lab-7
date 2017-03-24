//
//  ViewController.swift
//  canvas
//
//  Created by fer on 3/22/17.
//  Copyright © 2017 fer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var trayOriginalCenter: CGPoint!
  var trayDownOffset: CGFloat!
  var trayUp: CGPoint!
  var trayDown: CGPoint!
  var newlyCreatedFace: UIImageView!
  var newlyCreatedFaceOriginalCenter: CGPoint!
  
  @IBOutlet weak var trayView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    trayDownOffset = 0
    trayUp = trayView.center
    trayDown = CGPoint(x: trayView.center.x , y: trayView.center.y + trayDownOffset)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
    
    let translation = sender.translation(in: view)
    let velocity = sender.velocity(in: view)
    
    if sender.state == .began {
      trayOriginalCenter = trayView.center
    }
    else if sender.state == .changed {
      trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
    }
    else if sender.state == .ended {
      if velocity.y > 0 {
        UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                       animations: { () -> Void in
                        self.trayView.center = self.trayDown
        }, completion: nil)
      }
      else
      {
        UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                       animations: { () -> Void in
                        self.trayView.center = self.trayUp
        }, completion: nil)
      }
    }
  }
  
  @IBAction func didPanFace(_ sender: UIPanGestureRecognizer) {
    let translation = sender.translation(in: view)
    
    if sender.state == .began {
      
      var imageView = sender.view as! UIImageView
      newlyCreatedFace = UIImageView(image: imageView.image)
      view.addSubview(newlyCreatedFace)
      newlyCreatedFace.center = imageView.center
      newlyCreatedFace.center.y += trayView.frame.origin.y
      newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
    }
    else if sender.state == .changed {
      newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
    }
    else if sender.state == .ended {
      
    }
  }
  
  
}
