//
//  ReusableProtocols.swift
//  StylishExample
//
//  Created by Anastasia Tarasova on 08/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation
import UIKit

// MARK: Reusable View
protocol ReusableView: class
{
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView
{
    static var reuseIdentifier: String
    {
        return String(describing: self)
    }
}

// MARK: - NibLoadableView
protocol NibLoadableView: class
{
    static var nibName: String { get }
    static var nib: UINib? { get }
    static var bundle: Bundle { get }
    
    static func loadNib(for owner: UIView) throws
}

extension NibLoadableView where Self: UIView
{
    static var nibName: String
    {
        return String(describing: self)
    }
    
    static var nib: UINib?
    {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
    
    static var bundle: Bundle
    {
        return Bundle(for: self)
    }
    
    static func loadNib(for owner: UIView) throws
    {
        guard self.bundle.loadNibNamed(self.nibName, owner: owner, options: nil) != nil else
        {
            let message = "Failed to load nib named \(self.nibName)"
            throw AppErrors.General.appInconsistencyState(message: message)
        }
    }
}
