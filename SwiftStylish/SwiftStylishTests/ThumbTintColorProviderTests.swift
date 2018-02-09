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
    
    func testProviderForSwitch()
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
    
    func testProviderForSlider()
    {
        let sliderView = UISlider(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        sliderView.thumbTintColor = .green
        
        XCTAssert(sliderView.thumbTintColor == .green)
        
        do
        {
            try SwiftStylisher.default.applyStyle(className: "." + self.key, forObject: sliderView)
        }
        catch
        {
            XCTFail()
        }
        
        XCTAssert(sliderView.thumbTintColor == UIColor.red)
    }
}
