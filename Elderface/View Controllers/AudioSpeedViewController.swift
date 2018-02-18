//
//  AudioSpeedViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/17/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class AudioSpeedViewController: UIViewController {
    // UI Elements
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        //elderfaceSetup()
        playAudioSpeedAudio()
    }
    
    // Play enter name audio file
    func playAudioSpeedAudio() {
        let path = Bundle.main.path(forResource: "audio_speed.wav", ofType:nil)!
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
        // Button background layer
    }
    
    // Prepare segue
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "isOutlined" {
    //            let controller = segue.destination as! OutlineViewController
    //            controller.userElderface = userElderface
    //        }
    //    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


