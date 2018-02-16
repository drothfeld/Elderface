//
//  MenuPositionViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/16/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class MenuPositionViewController: UIViewController {
    // UI Elements
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        playMenuPositionAudio()
    }
    
    // Play enter name audio file
    func playMenuPositionAudio() {
        let path = Bundle.main.path(forResource: "menu_position.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


