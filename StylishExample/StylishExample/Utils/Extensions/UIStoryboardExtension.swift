//
//  UIStoryboardExtension.swift
//  StylishExample
//
//  Created by Anastasia Tarasova on 08/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard
{
    func instantiateInitialViewController<T: UIViewController>() throws -> T
    {
        guard let viewController = self.instantiateInitialViewController() as? T else
        {
            throw AppErrors.General.appInconsistencyState(message: "Couldn't instantiate initial view controller for storyboard \(self) ")
        }
        
        return viewController
    }
    
    func instantiateViewController<T: UIViewController>(_ type: T.Type) throws -> T where T: DescriptionProtocol
    {
        let identifier = T.storyboardIdentifier
        guard let viewController = self.instantiateViewController(withIdentifier: identifier) as? T else
        {
            throw AppErrors.General.appInconsistencyState(message: "Couldn't instantiate view controller with identifier \(identifier) for storyboard \(self) ")
        }
        
        return viewController
    }
}

