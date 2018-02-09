//
//  BadgeColorProviderTests.swift
//  SwiftStylishTests
//
//  Created by Anastasia Tarasova on 09/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation

import XCTest

@testable import SwiftStylish

class BadgeColorProviderTests: BaseProviderTests
{
    override func setUp()
    {
        super.setUp()
        self.key = StyleItemKeys.badgeColor.rawValue
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testProviderForTabBarItem()
    {
        guard #available(iOS 10.0, *) else
        {
            print("BadgeColor property is available since iOS 10.0")
            return
        }
        
        let tabBarItem = UITabBarItem(title: "no string", image: nil, tag: 0)

        
        tabBarItem.badgeColor = .blue
        XCTAssert(tabBarItem.badgeColor == UIColor.blue)
        
        do
        {
            try SwiftStylisher.default.applyStyle(className: "." + self.key, forObject: tabBarItem)
        }
        catch
        {
            XCTFail()
        }
        
        XCTAssert(tabBarItem.badgeColor == UIColor.red)
    }
    
    override func testProviderForObject()
    {
        super.testProviderForObject()
    }
}
