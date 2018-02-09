//
//  AppErrors.swift
//  StylishExample
//
//  Created by Anastasia Tarasova on 08/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation

class AppErrors
{
    enum General: Error
    {
        case appInconsistencyState(message: String)
    }
}
