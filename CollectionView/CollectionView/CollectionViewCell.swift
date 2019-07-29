//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Vibhor Gupta on 8/21/18.
//  Copyright © 2018 Vibhor Gupta. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLable : UILabel!
    @IBOutlet weak var selectionImage    : UIImageView!
    

    var isEditing : Bool = false {
        didSet {
            selectionImage.isHidden = !isEditing
        }
    }

    override var isSelected: Bool {
        didSet {
            if isEditing {
                selectionImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
            }
        }
    }
}
