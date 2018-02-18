//
//  ButtonColorViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/17/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class ButtonColorViewController: UIViewController {
    // UI Elements
    @IBOutlet weak var menuColorLayer: UIImageView!
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        elderfaceSetup()
        playButtonColorAudio()
    }
    
    // Play enter name audio file
    func playButtonColorAudio() {
        let path = Bundle.main.path(forResource: "button_color.wav", ofType:nil)!
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
        menuColorLayer.backgroundColor = userElderface.menuColor
    }
    
    // Prepare segue
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "textColor" {
                let controller = segue.destination as! TextColorViewController
                controller.userElderface = userElderface
            }
        }
    
    // Button color choices
    @IBAction func buttonColorBlack(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.black
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorRed(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.red
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorBlue(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.blue
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorGreen(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.green
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorMagenta(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.magenta
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorPurple(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.purple
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorGray(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.gray
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorOrange(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.white
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
