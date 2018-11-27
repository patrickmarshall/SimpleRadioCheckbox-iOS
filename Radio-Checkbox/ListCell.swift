//
//  ListCell.swift
//  Radio-Checkbox
//
//  Created by Patrick Marshall on 27/11/18.
//  Copyright © 2018 Patrick Marshall. All rights reserved.
//

import UIKit

enum Type {
    case radio
    case checkbox
}

class ListCell: UITableViewCell {

    @IBOutlet weak var imageIco: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ state: Type, object: List) {
        switch state {
        case .radio:
            if object.selected {
                imageIco.image = UIImage(named: "radioChecked")
            } else {
                imageIco.image = UIImage(named: "radioUncheck")
            }
        case .checkbox:
            if object.selected {
                imageIco.image = UIImage(named: "checkboxChecked")
            } else {
                imageIco.image = UIImage(named: "checkboxUncheck")
            }
        }
        labelTitle.text = object.title
    }
}
