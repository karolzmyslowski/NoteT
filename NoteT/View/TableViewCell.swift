//
//  TableViewCell.swift
//  NoteT
//
//  Created by Karol Zmyslowski on 09.02.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var fromLbn: UILabel!
    @IBOutlet weak var toLnb: UILabel!
    @IBOutlet weak var translateLbn: UILabel!
    
    
    func configureCell(item: Word) {
        mainLabel.text = item.title
        fromLbn.text = item.from
        toLnb.text = item.toTranslate
        translateLbn.text = item.translate
    }
}
