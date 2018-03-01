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
        playAudioSpeedAudio(audioFileURL: "audio_speed.wav")
    }
    
    // Play enter name audio file
    func playAudioSpeedAudio(audioFileURL: String) {
        let path = Bundle.main.path(forResource: audioFileURL, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    // Replay audio instructions
    @IBAction func playAudioAgain(_ sender: Any) {
        playAudioSpeedAudio(audioFileURL: "audio_speed.wav")
    }
    
    // Setup interface based on elderface values
    func elderfaceSetup() {
        // Menu background layer
        // Button background layer
    }
    
    // Prepare segue
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "completedElderface") {
                let controller = segue.destination as! ElderfaceViewController
                controller.userElderface = userElderface
            } else if (segue.identifier == "backToOutline") {
                let controller = segue.destination as! OutlineViewController
                controller.userElderface = userElderface
            }
        }
    
    // Back button is pressed
    @IBAction func goBackPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToOutline", sender: self)
    }
    
    // Choose audio speed
    @IBAction func slowAudioButtonPressed(_ sender: Any) {
        userElderface.audioSpeed = audio_speed_slow
        performSegue(withIdentifier: "completedElderface", sender: self)
    }
    
    @IBAction func normalAudioButtonPressed(_ sender: Any) {
        userElderface.audioSpeed = audio_speed_normal
        performSegue(withIdentifier: "completedElderface", sender: self)
    }
    
    @IBAction func fastAudioButtonPressed(_ sender: Any) {
        userElderface.audioSpeed = audio_speed_fast
        performSegue(withIdentifier: "completedElderface", sender: self)
    }
    
    // Test audio speed
    @IBAction func playSlowAudioButton(_ sender: Any) {
        playAudioSpeedAudio(audioFileURL: "audio_slow.wav")
    }
    
    @IBAction func playNormalAudioButton(_ sender: Any) {
        playAudioSpeedAudio(audioFileURL: "audio_normal.wav")
    }
    
    @IBAction func playFastAudioButton(_ sender: Any) {
        playAudioSpeedAudio(audioFileURL: "audio_fast.wav")
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


