//
//  ProgressImageProviderTests.swift
//  SwiftStylishTests
//
//  Created by Anastasia Tarasova on 09/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import XCTest

@testable import SwiftStylish

class ProgressImageProviderTests: BaseProviderTests
{
    override func setUp()
    {
        super.setUp()
        self.key = StyleItemKeys.progressImage.rawValue
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testProvider()
    {
        let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: 100, height: 3))
        progressView.progressImage = nil
        
        XCTAssert(progressView.progressImage == nil)
        
        do
        {
            try SwiftStylisher.default.applyStyle(className: "." + self.key, forObject: progressView)
        }
        catch
        {
            XCTFail()
        }
        
        let testImage2 = UIImage(named: "testImage2", in:Bundle(for: BackgroundColorProviderTests.self), compatibleWith: nil)
        XCTAssert(progressView.progressImage == testImage2)
    }
}
