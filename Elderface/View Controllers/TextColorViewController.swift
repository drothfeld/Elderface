//
//  TextColorViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/17/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class TextColorViewController: UIViewController {
    // UI Elements
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        //elderfaceSetup()
        playTextColorAudio()
    }
    
    // Play enter name audio file
    func playTextColorAudio() {
        let path = Bundle.main.path(forResource: "text_color.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    // Setup interface based on elderface values
//    func elderfaceSetup() {
//        menuColorLayer.backgroundColor = userElderface.menuColor
//    }
    
    // Prepare segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "textColor" {
//            let controller = segue.destination as! TextColorViewController
//            controller.userElderface = userElderface
//        }
//    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}





