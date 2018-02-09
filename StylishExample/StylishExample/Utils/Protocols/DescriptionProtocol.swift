//
//  DescriptionProtocol.swift
//  StylishExample
//
//  Created by Anastasia Tarasova on 08/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation


// MARK: - Description Protocol

protocol DescriptionProtocol: NSObjectProtocol
{
    static var storyboardIdentifier: String { get }
}

extension DescriptionProtocol
{
    static var storyboardIdentifier: String
    {
        return String(describing: self)
    }
}
