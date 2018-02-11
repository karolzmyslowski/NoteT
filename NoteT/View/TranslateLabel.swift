//
//  TranslateLabel.swift
//  NoteT
//
//  Created by Karol Zmyslowski on 09.02.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class TranslateLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 2
        layer.borderColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1).cgColor
        layer.cornerRadius = 8
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize (width: 5, height: 2)
        layer.shadowColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 1).cgColor
        
    }

}
