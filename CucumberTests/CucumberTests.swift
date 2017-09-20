//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//


/*

 This is sample code created by XCFit Framework and can be edited/Removed as needed.
 
 This is very important file as we will be using it as initialiser of all out test suite. We have to resgister all our Step Definitions in this class. e.g we have registed CommonStepDefinitions and HomeScreenSteps here

 */


import Foundation
import Cucumberish

class CucumberTests: NSObject {
    
    class func CucumberishSwiftInit()
    {
        var app : XCUIApplication!
        //A closure that will be executed just before executing any of your features
        beforeStart { () -> Void in
            app = XCUIApplication()
            CommonStepDefinitions.setup(app);
            HomeScreenSteps().HomeScreenSteps()
        }
        
        //A Given step definition
//        Given("the app is running") { (args, userInfo) -> Void in
//            application.launch()
//            
//        }
        
        // MARK: - SignIn
        
        Given("^ID is \"(.*)\"$") { (args, userInfo) -> Void in
            
//            let app = XCUIApplication()
            app.launch()
            
            let idTextField = app.textFields["ID"]
            idTextField.tap()
            idTextField.typeText((args?[0])!)
            
            And("^Password is (.*)$") { (args, userInfo) -> Void in
                let passwordTextField = app.textFields["Password"]
                passwordTextField.tap()
                passwordTextField.typeText((args?[0])!)
            }
            
            When("tape SignIn") { (args, userInfo) -> Void in
                app.buttons["SignIn"].tap()
//                                XCTAssertTrue(false)
            }
            
            Then("dismiss SignIn Page") { (args, userInfo) -> Void in
                
                let navBar = app.navigationBars.staticTexts["SignIn"]
                XCTAssertFalse(navBar.exists)
            }
            
            // MARK: - Calculate balance
            
            // Example1
            Given("^balance is ([0-9]+)$") { (args, userInfo) -> Void in
                
                let capitalTextField = app.textFields["Capital"]
                capitalTextField.tap()
                
                if capitalTextField.buttons["Clear text"].exists
                {
                    capitalTextField.buttons["Clear text"].tap()
                }
                
                capitalTextField.typeText( (args?[0])! )
                
                And("^annual interest rate is ([0-9]+(.[0-9]{1,2})?)$") { (args, userInfo) -> Void in
                    let interestTextField = app.textFields["Interest"]
                    interestTextField.tap()
                    
                    if interestTextField.buttons["Clear text"].exists
                    {
                        interestTextField.buttons["Clear text"].tap()
                    }
                    
                    interestTextField.typeText( (args?[0])! )
                }
                
                When("calculate interest") { (args, userInfo) -> Void in
                    app.buttons["Calculate"].tap()
                }
                
                Then("balance becomes ([0-9]+(.[0-9]{1,2})?)$") { (args, userInfo) -> Void in
                    
                    XCTAssertEqual(app.staticTexts["Balance"].label, (args?[0])!)
                }
            }
            
            // MARK: - SignOut
            
            Given("at Calculate page") { (args, userInfo) -> Void in
                
                When("tape SignOut") { (args, userInfo) -> Void in
                    app.navigationBars["Calcaulate Balance"].buttons["SignOut"].tap()
                }
                
                Then("prompt SignIn page") { (args, userInfo) -> Void in
                    let navBar = app.navigationBars.staticTexts["SignIn"]
                    
                    XCTAssert(navBar.exists)
                    XCTAssertEqual(navBar.label, "SignIn")
                }
            }
        }
        
        let bundle = Bundle(for: CucumberTests.self)

        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }
}
