//
//  MenuColorViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/16/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class MenuColorViewController: UIViewController {
    // UI Elements
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        playMenuColorAudio()
    }
    
    // Play enter name audio file
    func playMenuColorAudio() {
        let path = Bundle.main.path(forResource: "menu_color.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    // Prepare segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "menuColor" {
//            let controller = segue.destination as! MenuColorViewController
//            controller.userElderface = userElderface
//        }
//    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}



