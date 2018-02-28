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
    
    // Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menuColor" {
            let controller = segue.destination as! MenuColorViewController
            controller.userElderface = userElderface
        } else if (segue.identifier == "backToTextSize") {
            let controller = segue.destination as! TextSizeViewController
            controller.userElderface = userElderface
        }
    }
    
    // Back button is pressed
    @IBAction func goBackPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToTextSize", sender: self)
    }
    
    // Menu position button pressed
    @IBAction func menuLeftButtonPressed(_ sender: Any) {
        userElderface.menuPosition = menu_left
        performSegue(withIdentifier: "menuColor", sender: self)
    }
    
    @IBAction func menuRightButtonPressed(_ sender: Any) {
        userElderface.menuPosition = menu_right
        performSegue(withIdentifier: "menuColor", sender: self)
    }
    
    @IBAction func menuBottomButtonPressed(_ sender: Any) {
        userElderface.menuPosition = menu_bottom
        performSegue(withIdentifier: "menuColor", sender: self)
    }
    
    @IBAction func menuTopButtonPressed(_ sender: Any) {
        userElderface.menuPosition = menu_top
        performSegue(withIdentifier: "menuColor", sender: self)
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


