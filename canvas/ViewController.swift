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
  
  @IBOutlet weak var trayView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    trayDownOffset = 160
    trayUp = trayView.center
    trayDown = CGPoint(x: trayView.center.x , y: trayView.center.y + trayDownOffset)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
    
    let translation = sender.translation(in: view)
    var velocity = sender.velocity(in: view)
    
    if sender.state == .began {
      trayOriginalCenter = trayView.center
    }
    else if sender.state == .changed {
      trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
    }
    else if sender.state == .ended {
      
    }
  }

}

