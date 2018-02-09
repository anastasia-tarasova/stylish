//
//  SeparatorStyleProviderTests.swift
//  SwiftStylishTests
//
//  Created by Anastasia Tarasova on 09/02/2018.
//  Copyright © 2018 DSR. All rights reserved.
//

import XCTest

@testable import SwiftStylish

class SeparatorStyleProviderTests: BaseProviderTests
{
    override func setUp()
    {
        super.setUp()
        self.key = StyleItemKeys.separatorStyle.rawValue
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testProviderForTableView()
    {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tableView.separatorStyle = .singleLine
        XCTAssert(tableView.separatorStyle == .singleLine)
        
        do
        {
            try SwiftStylisher.default.applyStyle(className: "." + self.key, forObject: tableView)
        }
        catch let error
        {
            XCTFail(error.localizedDescription)
        }
        
        XCTAssert(tableView.separatorStyle == .none)
    }
    
    override func testProviderForObject()
    {
        super.testProviderForObject()
    }
}
