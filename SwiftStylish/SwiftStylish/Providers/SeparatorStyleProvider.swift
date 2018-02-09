//
//  SeparatorStyleProvider.swift
//  SwiftStylish
//
//  Created by Anastasia Tarasova on 09/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import UIKit

/**
 Provides **sepratorStyle** value to subclasses of:
 - UITableView
 */
class SeparatorStyleProvider: BaseProvider {}

extension SeparatorStyleProvider: TableViewProviderProtocol
{
    func applyItem(forTableView tableView: UITableView, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        tableView.separatorStyle = try value.toSeparatorStyle()
    }
}
