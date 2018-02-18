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
            audioFileURL = "elderface_complete_slow.wav"
        } else if (userElderface.audioSpeed == audio_speed_normal) {
            audioFileURL = "elderface_complete_normal.wav"
        } else {
            audioFileURL = "elderface_complete_fast.wav"
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
            
        }
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



