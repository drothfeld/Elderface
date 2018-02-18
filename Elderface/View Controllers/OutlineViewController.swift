//
//  OutlineViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/17/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class OutlineViewController: UIViewController {
    // UI Elements
    @IBOutlet weak var menuYesOutlined: UIImageView!
    @IBOutlet weak var buttonYesOutlined: UIButton!
    @IBOutlet weak var menuNotOutlined: UIImageView!
    @IBOutlet weak var buttonNotOutlined: UIButton!
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        elderfaceSetup()
        playIsOutlinedAudio()
    }
    
    // Play enter name audio file
    func playIsOutlinedAudio() {
        let path = Bundle.main.path(forResource: "is_outlined.wav", ofType:nil)!
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
        // Menu background layer
        menuYesOutlined.backgroundColor = userElderface.menuColor
        menuNotOutlined.backgroundColor = userElderface.menuColor
        // Button background layer
        buttonYesOutlined.backgroundColor = userElderface.menuButtonColor
        buttonNotOutlined.backgroundColor = userElderface.menuButtonColor
        // Button text layer
        buttonYesOutlined.setTitleColor(userElderface.menuTextColor, for: .normal)
        buttonNotOutlined.setTitleColor(userElderface.menuTextColor, for: .normal)
    }
    
    // Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "audioSpeed" {
            let controller = segue.destination as! AudioSpeedViewController
            controller.userElderface = userElderface
        }
    }
    
    // isOutlined button is pressed
    @IBAction func yesOutlinedButtonPressed(_ sender: Any) {
        userElderface.isOutlined = true
        performSegue(withIdentifier: "audioSpeed", sender: self)
    }
    
    @IBAction func notOutlinedButtonPressed(_ sender: Any) {
        userElderface.isOutlined = false
        performSegue(withIdentifier: "audioSpeed", sender: self)
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

