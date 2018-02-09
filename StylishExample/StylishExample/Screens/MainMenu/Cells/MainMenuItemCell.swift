//
//  MainMenuItemCell.swift
//  StylishExample
//
//  Created by Anastasia Tarasova on 08/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation
import UIKit

class MainMenuItemCell: UITableViewCell, RegisteredTableViewCell
{
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setup(title: String)
    {
        self.titleLabel.text = title
    }
}
