//
//  MenuItem.swift
//  StylishExample
//
//  Created by Anastasia Tarasova on 08/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation

class MenuItem
{
    var title = String()
    var navigationClosure: () -> Void
    
    init(title: String, navigationClosure: @escaping () -> Void)
    {
        self.title = title
        self.navigationClosure = navigationClosure
    }
}
