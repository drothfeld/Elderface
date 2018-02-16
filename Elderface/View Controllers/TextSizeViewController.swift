//
//  TextSizeViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/15/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class TextSizeViewController: UIViewController {
    // UI Elements
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        playTextSizeAudio()
    }
    
    // Play enter name audio file
    func playTextSizeAudio() {
        let path = Bundle.main.path(forResource: "text_size.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    // Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menuPosition" {
            let controller = segue.destination as! MenuPositionViewController
            controller.userElderface = userElderface
        }
    }
    
    // Text size button is pressed
    @IBAction func smallTextSizePressed(_ sender: Any) {
        userElderface.menuTextSize = menu_text_small
        performSegue(withIdentifier: "menuPosition", sender: self)
    }
    
    @IBAction func normalTextSizePressed(_ sender: Any) {
        userElderface.menuTextSize = menu_text_normal
        performSegue(withIdentifier: "menuPosition", sender: self)
    }
    
    @IBAction func largeTextSizePressed(_ sender: Any) {
        userElderface.menuTextSize = menu_text_large
        performSegue(withIdentifier: "menuPosition", sender: self)
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

