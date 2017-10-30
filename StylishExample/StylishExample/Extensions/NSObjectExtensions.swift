//
//  NSObjectExtensions.swift
//  iOSWallet
//
//  Created by Lobanov Mihail on 17.10.17.
//  Copyright © 2017 Aubill. All rights reserved.
//

import Foundation
import SwiftStylish

extension NSObject
{
    func applyStyleClass(byName name: String, filename: String)
    {
        do
        {
            try SwiftStylisher.default.loadFile(filename: filename, bundle: Bundle.main)
            try SwiftStylisher.default.applyStyle(className: name, forObject: self)
        }
        catch ParserError.emptyState(let forClass, let state)
        {
            assertionFailure("Empty state \(state) in class \(forClass)")
        }
        catch ParserError.incorrectPreloadsTypeValue(let forClass)
        {
            assertionFailure("Incorrect preloads type value for class \(forClass)")
        }
        catch ParserError.notContainsNecessaryKey(let key)
        {
            assertionFailure("Not contains necessary key \(key)")
        }
        catch ParserError.unknownKey(let forClass, let key)
        {
            assertionFailure("Unknown key \(key) in class \(forClass)")
        }
        catch LoaderError.incorrectDataInFile(let message)
        {
            assertionFailure("Incorrect format of data in file with \(message)")
        }
        catch LoaderError.invalidFile(let name)
        {
            assertionFailure("Invalid file with name \(name)")
        }
        catch StyleValueError.invalidParameterType(let type, let requiredTypes)
        {
            assertionFailure("Invalid parameter type of \(type). Required types are \(requiredTypes).")
        }
        catch StyleValueError.invalidParameterValue(let parameter, let currentValue, let possibleValues)
        {
            assertionFailure("Invalid parameter value \(currentValue) of \(parameter). Possible values are \(possibleValues).")
        }
        catch StyleValueError.missingRequiredParameter(let name, let forTypeValue)
        {
            assertionFailure("Missing required parameter \(name) for \(forTypeValue).")
        }
        catch ApplyItemError.keyNotSupported(let key, let forType, _)
        {
            assertionFailure("Can not applied \(key) for type \(forType)")
        }
        catch ApplyItemError.classNotFound(let className)
        {
            assertionFailure("Can not find class with name \(className)")
        }
        catch let error
        {
            print( error.localizedDescription)
            assertionFailure(error.localizedDescription)
        }
    }
}
