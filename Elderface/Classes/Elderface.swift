//
//  Elderface.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/15/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit

class Elderface {
    // Fields
    var user: String
    var audioSpeed: Int
    var menuTextSize: Int
    var menuTextColor: UIColor
    var menuColor: UIColor
    var isOutlined: Bool
    var menuButtonColor: UIColor
    var menuButtonOutlineColor: UIColor
    var menuPosition: Int
    var screenBackgroundColor: UIColor
    var screenTextSize: Int
    
    // Constructor
    init(user: String) {
        self.user = user
        self.audioSpeed = audio_speed_normal
        self.menuTextSize = menu_text_normal
        self.menuPosition = menu_top
        self.screenTextSize = screen_text_normal
        self.menuTextColor = UIColor.black
        self.menuColor = UIColor.white
        self.isOutlined = false
        self.menuButtonColor = UIColor.white
        self.menuButtonOutlineColor = UIColor.black
        self.screenBackgroundColor = UIColor.white
    }
}


