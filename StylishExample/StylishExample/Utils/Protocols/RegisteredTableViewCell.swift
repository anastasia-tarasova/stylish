//
//  RegisteredTableViewCell.swift
//  StylishExample
//
//  Created by Anastasia Tarasova on 08/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation
import UIKit

protocol RegisteredTableViewCell: ReusableView, NibLoadableView
{
    static func register(for tableView: UITableView)
}

extension RegisteredTableViewCell where Self: UITableViewCell
{
    static func register(for tableView: UITableView)
    {
        if Self.nib != nil
        {
            tableView.register(self.nib, forCellReuseIdentifier: self.reuseIdentifier)
        }
        else
        {
            tableView.register(self, forCellReuseIdentifier: self.reuseIdentifier)
        }
    }
}
