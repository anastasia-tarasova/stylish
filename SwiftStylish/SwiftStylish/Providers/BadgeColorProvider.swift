//
//  BadgeColorProvider.swift
//  SwiftStylish
//
//  Created by Anastasia Tarasova on 09/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import UIKit

/**
 Provides **badgeColor** value to subclasses of:
 - UITabBarItem
 */
class BadgeColorProvider: BaseProvider {}

extension BadgeColorProvider: TabBarItemProviderProtocol
{
    func applyItem(forTabBarItem tabBarItem: UITabBarItem, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        if #available(iOS 10.0, *)
        {
            tabBarItem.badgeColor = try value.toColor()
        }
    }
}
