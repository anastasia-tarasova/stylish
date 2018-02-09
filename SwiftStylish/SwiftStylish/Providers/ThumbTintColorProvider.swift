//
//  ThumbTintColorProvider.swift
//  SwiftStylish
//
//  Created by Anastasia Tarasova on 09/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import UIKit

/**
 Provides **track-tint-color** value to subclasses of:
 - UISwitch
 */
class ThumbTintColorProvider: BaseProvider {}

extension ThumbTintColorProvider: SwitchViewProviderProtocol
{
    func applyItem(forSwitch sw: UISwitch, item: StyleItem, variables: StyleVariables?) throws
    {
        let value = StyleValue(value: item.value, bundle: self.bundle, variables: variables)
        sw.thumbTintColor = try value.toColor()
    }
}

