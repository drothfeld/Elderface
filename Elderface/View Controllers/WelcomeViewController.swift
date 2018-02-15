//
//  ViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 1/30/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer: AVAudioPlayer!

class WelcomeViewController: UIViewController {
    // UI Elements
    @IBOutlet weak var LabelTapAnywhere: UILabel!
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        playWelcomeAudio()
        LabelTapAnywhere.startBlink()
    }
    
    // Play welcome audio file
    func playWelcomeAudio() {
        let path = Bundle.main.path(forResource: "welcome_to_elderface_full.wav", ofType:nil)!
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

// UILabel extension to enable blinking animation
extension UILabel {
    // Start blinking
    func startBlink() {
        UIView.animate(withDuration: 1.0,
                       delay:0.0,
                       options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: { self.alpha = 0.10 },
                       completion: nil)
    }
    // Stop blinking
    func stopBlink() {
        layer.removeAllAnimations()
        alpha = 1
    }
}

