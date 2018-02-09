//
//  ThumbTintColorProviderTests.swift
//  SwiftStylishTests
//
//  Created by Anastasia Tarasova on 09/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import Foundation

import XCTest

@testable import SwiftStylish

class ThumbTintColorProviderTests: BaseProviderTests
{
    override func setUp()
    {
        super.setUp()
        self.key = StyleItemKeys.thumbTintColor.rawValue
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testProvider()
    {
        let switchView = UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        switchView.thumbTintColor = .green
        
        XCTAssert(switchView.thumbTintColor == .green)
        
        do
        {
            try SwiftStylisher.default.applyStyle(className: "." + self.key, forObject: switchView)
        }
        catch
        {
            XCTFail()
        }
        
        XCTAssert(switchView.thumbTintColor == UIColor.red)
    }
}
