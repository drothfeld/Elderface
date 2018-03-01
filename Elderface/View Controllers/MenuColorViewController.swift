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
    
    // Replay audio instructions
    @IBAction func playAudioAgain(_ sender: Any) {
        playMenuColorAudio()
    }
    
    // Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "buttonColor" {
            let controller = segue.destination as! ButtonColorViewController
            controller.userElderface = userElderface
        } else if (segue.identifier == "backToMenuPosition") {
            let controller = segue.destination as! MenuPositionViewController
            controller.userElderface = userElderface
        }
    }
    
    // Back button is pressed
    @IBAction func goBackPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToMenuPosition", sender: self)
    }
    
    // Menu Color Selection Buttons
    @IBAction func menuColorBlackButton(_ sender: Any) {
        userElderface.menuColor = UIColor.black
        performSegue(withIdentifier: "buttonColor", sender: self)
    }
    
    @IBAction func menuColorRedButton(_ sender: Any) {
        userElderface.menuColor = UIColor.red
        performSegue(withIdentifier: "buttonColor", sender: self)
    }
    
    @IBAction func menuColorBlueButton(_ sender: Any) {
        userElderface.menuColor = UIColor.blue
        performSegue(withIdentifier: "buttonColor", sender: self)
    }
    
    @IBAction func menuColorGreenButton(_ sender: Any) {
        userElderface.menuColor = UIColor.green
        performSegue(withIdentifier: "buttonColor", sender: self)
    }
    
    @IBAction func menuColorMagentaButton(_ sender: Any) {
        userElderface.menuColor = UIColor.magenta
        performSegue(withIdentifier: "buttonColor", sender: self)
    }
    
    @IBAction func menuColorPurpleButton(_ sender: Any) {
        userElderface.menuColor = UIColor.purple
        performSegue(withIdentifier: "buttonColor", sender: self)
    }
    
    @IBAction func menuColorGrayButton(_ sender: Any) {
        userElderface.menuColor = UIColor.gray
        performSegue(withIdentifier: "buttonColor", sender: self)
    }
    
    @IBAction func menuColorOrangeButton(_ sender: Any) {
        userElderface.menuColor = UIColor.white
        performSegue(withIdentifier: "buttonColor", sender: self)
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}



