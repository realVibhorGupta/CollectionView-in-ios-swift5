//
//  DetailsViewController.swift
//  CollectionView
//
//  Created by Vibhor Gupta on 8/21/18.
//  Copyright © 2018 Vibhor Gupta. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var selection : String!

    @IBOutlet weak var detailsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsLabel.text = selection
        navigationController?.title = "Details "
    }



}
