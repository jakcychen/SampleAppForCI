//
//  SampleAppForCIUITests.swift
//  SampleAppForCIUITests
//
//  Created by JackyChen on 2016/12/20.
//  Copyright © 2016年 JackyChen. All rights reserved.
//

import XCTest

class SampleAppForCIUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        let idTextField = app.textFields["ID"]
        idTextField.tap()
        idTextField.typeText("Jacky")
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("12345678")
        app.buttons["SignIn"].tap()
//        app.navigationBars["Calcaulate Balance"].buttons["SignOut"].tap()
    }
    
    func testRevenue()
    {
        let app = XCUIApplication()
        let capitalTextField = app.textFields["Capital"]
        capitalTextField.tap()
        capitalTextField.typeText("1000")
        
        let interestTextField = XCUIApplication().textFields["Interest"]
        interestTextField.tap()
        interestTextField.typeText("0.05")
        
        app.buttons["Calculate"].tap()
        
    }
    
}
