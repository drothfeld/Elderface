//
//  ElderfaceViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/18/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class ElderfaceViewController: UIViewController {
    // UI Elements
    @IBOutlet weak var RestartElderfaceDemoButton: UIButton!
    @IBOutlet weak var ApplicationContentView: UIView!
    // Top position
    @IBOutlet weak var TopPositionMenu: UIView!
    @IBOutlet weak var TopPositionUsername: UILabel!
    @IBOutlet weak var TopPositionButtonA: UIButton!
    @IBOutlet weak var TopPositionButtonB: UIButton!
    @IBOutlet weak var TopPositionButtonC: UIButton!
    @IBOutlet weak var TopPositionButtonD: UIButton!
    @IBOutlet weak var TopPositionButtonE: UIButton!
    // Right position
    @IBOutlet weak var RightPositionMenu: UIView!
    @IBOutlet weak var RightPositionUsername: UILabel!
    @IBOutlet weak var RightPositionButtonA: UIButton!
    @IBOutlet weak var RightPositionButtonB: UIButton!
    @IBOutlet weak var RightPositionButtonC: UIButton!
    @IBOutlet weak var RightPositionButtonD: UIButton!
    @IBOutlet weak var RightPositionButtonE: UIButton!
    // Bottom position
    @IBOutlet weak var BottomPositionMenu: UIView!
    @IBOutlet weak var BottomPositionUsername: UILabel!
    @IBOutlet weak var BottomPositionButtonA: UIButton!
    @IBOutlet weak var BottomPositionButtonB: UIButton!
    @IBOutlet weak var BottomPositionButtonC: UIButton!
    @IBOutlet weak var BottomPositionButtonD: UIButton!
    @IBOutlet weak var BottomPositionButtonE: UIButton!
    // Left position
    @IBOutlet weak var LeftPositionMenu: UIView!
    @IBOutlet weak var LeftPositionUsername: UILabel!
    @IBOutlet weak var LeftPositionButtonA: UIButton!
    @IBOutlet weak var LeftPositionButtonB: UIButton!
    @IBOutlet weak var LeftPositionButtonC: UIButton!
    @IBOutlet weak var LeftPositionButtonD: UIButton!
    @IBOutlet weak var LeftPositionButtonE: UIButton!
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        elderfaceSetup()
        playElderfaceCompleteAudio()
    }
    
    // Play enter name audio file
    func playElderfaceCompleteAudio() {
        let audioFileURL: String
        // Getting correct speed audio file
        if (userElderface.audioSpeed == audio_speed_slow) {
            audioFileURL = "complete_slow.wav"
        } else if (userElderface.audioSpeed == audio_speed_normal) {
            audioFileURL = "complete_normal.wav"
        } else {
            audioFileURL = "complete_fast.wav"
        }
        
        let path = Bundle.main.path(forResource: audioFileURL, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    // Setup interface based on elderface values
    func elderfaceSetup() {
        // Top position
        if (userElderface.menuPosition == menu_top) {
            // Menu
            ApplicationContentView.frame.origin.y += 70
            TopPositionMenu.isHidden = false
            TopPositionMenu.backgroundColor = userElderface.menuColor
            if (userElderface.isOutlined) { TopPositionMenu.layer.borderWidth = 4.00 }
            // Username Text
            TopPositionUsername.text = userElderface.user
            TopPositionUsername.font = UIFont(name:"Lato", size: 30.00)
            TopPositionUsername.textColor = userElderface.menuTextColor
            // Buttons
            if (userElderface.isOutlined) {
                TopPositionButtonA.layer.borderWidth = 4.00
                TopPositionButtonB.layer.borderWidth = 4.00
                TopPositionButtonC.layer.borderWidth = 4.00
                TopPositionButtonD.layer.borderWidth = 4.00
                TopPositionButtonE.layer.borderWidth = 4.00
            }
            TopPositionButtonA.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            TopPositionButtonB.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            TopPositionButtonC.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            TopPositionButtonD.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            TopPositionButtonE.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            TopPositionButtonA.setTitleColor(userElderface.menuTextColor, for: .normal)
            TopPositionButtonB.setTitleColor(userElderface.menuTextColor, for: .normal)
            TopPositionButtonC.setTitleColor(userElderface.menuTextColor, for: .normal)
            TopPositionButtonD.setTitleColor(userElderface.menuTextColor, for: .normal)
            TopPositionButtonE.setTitleColor(userElderface.menuTextColor, for: .normal)
            TopPositionButtonA.backgroundColor = userElderface.menuButtonColor
            TopPositionButtonB.backgroundColor = userElderface.menuButtonColor
            TopPositionButtonC.backgroundColor = userElderface.menuButtonColor
            TopPositionButtonD.backgroundColor = userElderface.menuButtonColor
            TopPositionButtonE.backgroundColor = userElderface.menuButtonColor
        }
        
        // Bottom position
        else if (userElderface.menuPosition == menu_bottom) {
            // Menu
            ApplicationContentView.frame.origin.y -= 70
            BottomPositionMenu.isHidden = false
            BottomPositionMenu.backgroundColor = userElderface.menuColor
            if (userElderface.isOutlined) { BottomPositionMenu.layer.borderWidth = 4.00 }
            // Username Text
            BottomPositionUsername.text = userElderface.user
            BottomPositionUsername.font = UIFont(name:"Lato", size: 30.00)
            BottomPositionUsername.textColor = userElderface.menuTextColor
            // Buttons
            if (userElderface.isOutlined) {
                BottomPositionButtonA.layer.borderWidth = 4.00
                BottomPositionButtonB.layer.borderWidth = 4.00
                BottomPositionButtonC.layer.borderWidth = 4.00
                BottomPositionButtonD.layer.borderWidth = 4.00
                BottomPositionButtonE.layer.borderWidth = 4.00
            }
            BottomPositionButtonA.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            BottomPositionButtonB.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            BottomPositionButtonC.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            BottomPositionButtonD.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            BottomPositionButtonE.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            BottomPositionButtonA.setTitleColor(userElderface.menuTextColor, for: .normal)
            BottomPositionButtonB.setTitleColor(userElderface.menuTextColor, for: .normal)
            BottomPositionButtonC.setTitleColor(userElderface.menuTextColor, for: .normal)
            BottomPositionButtonD.setTitleColor(userElderface.menuTextColor, for: .normal)
            BottomPositionButtonE.setTitleColor(userElderface.menuTextColor, for: .normal)
            BottomPositionButtonA.backgroundColor = userElderface.menuButtonColor
            BottomPositionButtonB.backgroundColor = userElderface.menuButtonColor
            BottomPositionButtonC.backgroundColor = userElderface.menuButtonColor
            BottomPositionButtonD.backgroundColor = userElderface.menuButtonColor
            BottomPositionButtonE.backgroundColor = userElderface.menuButtonColor
        }
        
        // Right position
        else if (userElderface.menuPosition == menu_right) {
            // Menu
            ApplicationContentView.frame.origin.x -= 100
            RightPositionMenu.isHidden = false
            RightPositionMenu.backgroundColor = userElderface.menuColor
            if (userElderface.isOutlined) { RightPositionMenu.layer.borderWidth = 4.00 }
            // Username Text
            RightPositionUsername.text = userElderface.user
            RightPositionUsername.font = UIFont(name:"Lato", size: 30.00)
            RightPositionUsername.textColor = userElderface.menuTextColor
            // Buttons
            if (userElderface.isOutlined) {
                RightPositionButtonA.layer.borderWidth = 4.00
                RightPositionButtonB.layer.borderWidth = 4.00
                RightPositionButtonC.layer.borderWidth = 4.00
                RightPositionButtonD.layer.borderWidth = 4.00
                RightPositionButtonE.layer.borderWidth = 4.00
            }
            RightPositionButtonA.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            RightPositionButtonB.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            RightPositionButtonC.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            RightPositionButtonD.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            RightPositionButtonE.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            RightPositionButtonA.setTitleColor(userElderface.menuTextColor, for: .normal)
            RightPositionButtonB.setTitleColor(userElderface.menuTextColor, for: .normal)
            RightPositionButtonC.setTitleColor(userElderface.menuTextColor, for: .normal)
            RightPositionButtonD.setTitleColor(userElderface.menuTextColor, for: .normal)
            RightPositionButtonE.setTitleColor(userElderface.menuTextColor, for: .normal)
            RightPositionButtonA.backgroundColor = userElderface.menuButtonColor
            RightPositionButtonB.backgroundColor = userElderface.menuButtonColor
            RightPositionButtonC.backgroundColor = userElderface.menuButtonColor
            RightPositionButtonD.backgroundColor = userElderface.menuButtonColor
            RightPositionButtonE.backgroundColor = userElderface.menuButtonColor
        }
        
        // Left position
        else if (userElderface.menuPosition == menu_left) {
            // Menu
            ApplicationContentView.frame.origin.x += 100
            LeftPositionMenu.isHidden = false
            LeftPositionMenu.backgroundColor = userElderface.menuColor
            if (userElderface.isOutlined) { LeftPositionMenu.layer.borderWidth = 4.00 }
            // Username Text
            LeftPositionUsername.text = userElderface.user
            LeftPositionUsername.font = UIFont(name:"Lato", size: 30.00)
            LeftPositionUsername.textColor = userElderface.menuTextColor
            // Buttons
            if (userElderface.isOutlined) {
                LeftPositionButtonA.layer.borderWidth = 4.00
                LeftPositionButtonB.layer.borderWidth = 4.00
                LeftPositionButtonC.layer.borderWidth = 4.00
                LeftPositionButtonD.layer.borderWidth = 4.00
                LeftPositionButtonE.layer.borderWidth = 4.00
            }
            LeftPositionButtonA.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            LeftPositionButtonB.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            LeftPositionButtonC.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            LeftPositionButtonD.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            LeftPositionButtonE.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(userElderface.menuTextSize))
            LeftPositionButtonA.setTitleColor(userElderface.menuTextColor, for: .normal)
            LeftPositionButtonB.setTitleColor(userElderface.menuTextColor, for: .normal)
            LeftPositionButtonC.setTitleColor(userElderface.menuTextColor, for: .normal)
            LeftPositionButtonD.setTitleColor(userElderface.menuTextColor, for: .normal)
            LeftPositionButtonE.setTitleColor(userElderface.menuTextColor, for: .normal)
            LeftPositionButtonA.backgroundColor = userElderface.menuButtonColor
            LeftPositionButtonB.backgroundColor = userElderface.menuButtonColor
            LeftPositionButtonC.backgroundColor = userElderface.menuButtonColor
            LeftPositionButtonD.backgroundColor = userElderface.menuButtonColor
            LeftPositionButtonE.backgroundColor = userElderface.menuButtonColor
        }
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}



