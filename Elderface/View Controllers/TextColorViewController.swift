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
    @IBOutlet weak var menuColorLayer: UIImageView!
    @IBOutlet weak var buttonBlack: UIButton!
    @IBOutlet weak var buttonRed: UIButton!
    @IBOutlet weak var buttonBlue: UIButton!
    @IBOutlet weak var buttonGreen: UIButton!
    @IBOutlet weak var buttonMagenta: UIButton!
    @IBOutlet weak var buttonPurple: UIButton!
    @IBOutlet weak var buttonGray: UIButton!
    @IBOutlet weak var buttonOrange: UIButton!
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        elderfaceSetup()
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
    func elderfaceSetup() {
        // Menu background layer
        menuColorLayer.backgroundColor = userElderface.menuColor
        // Button background layer
        buttonBlack.backgroundColor = userElderface.menuButtonColor
        buttonRed.backgroundColor = userElderface.menuButtonColor
        buttonBlue.backgroundColor = userElderface.menuButtonColor
        buttonGreen.backgroundColor = userElderface.menuButtonColor
        buttonMagenta.backgroundColor = userElderface.menuButtonColor
        buttonPurple.backgroundColor = userElderface.menuButtonColor
        buttonGray.backgroundColor = userElderface.menuButtonColor
        buttonOrange.backgroundColor = userElderface.menuButtonColor
    }
    
    // Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "isOutlined" {
            let controller = segue.destination as! OutlineViewController
            controller.userElderface = userElderface
        }
    }
    
    // Text color button pressed
    @IBAction func blackTextButtonPressed(_ sender: Any) {
        userElderface.menuTextColor = UIColor.black
        performSegue(withIdentifier: "isOutlined", sender: self)
    }
    
    @IBAction func redTextButtonPressed(_ sender: Any) {
        userElderface.menuTextColor = UIColor.red
        performSegue(withIdentifier: "isOutlined", sender: self)
    }
    
    @IBAction func blueTextButtonPressed(_ sender: Any) {
        userElderface.menuTextColor = UIColor.blue
        performSegue(withIdentifier: "isOutlined", sender: self)
    }
    
    @IBAction func greenTextButtonPressed(_ sender: Any) {
        userElderface.menuTextColor = UIColor.green
        performSegue(withIdentifier: "isOutlined", sender: self)
    }
    
    @IBAction func magentaTextButtonPressed(_ sender: Any) {
        userElderface.menuTextColor = UIColor.magenta
        performSegue(withIdentifier: "isOutlined", sender: self)
    }
    
    @IBAction func purpleTextButtonPressed(_ sender: Any) {
        userElderface.menuTextColor = UIColor.purple
        performSegue(withIdentifier: "isOutlined", sender: self)
    }
    
    @IBAction func grayTextButtonPressed(_ sender: Any) {
        userElderface.menuTextColor = UIColor.gray
        performSegue(withIdentifier: "isOutlined", sender: self)
    }
    
    @IBAction func orangeTextButtonPressed(_ sender: Any) {
        userElderface.menuTextColor = UIColor.orange
        performSegue(withIdentifier: "isOutlined", sender: self)
    }
    
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}





