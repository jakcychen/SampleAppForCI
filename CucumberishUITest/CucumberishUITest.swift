//
//
//  Created by XCFit Framework
//  Copyright © 2016 XCFit Framework. All rights reserved.
//

import Foundation
import XCTest
class CucumberishUITest: NSObject {
    class func CucumberishSwiftInit()
    {
        beforeStart { () -> Void in
            
        }
        
        // MARK: - SignIn
        
        Given("^ID is \"(.*)\"$") { (args, userInfo) -> Void in
            
            let app = XCUIApplication()
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
                //                XCTAssertTrue(false)
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
        
        // MARK: - excuteFeature
        //Tell Cucumberish the name of your features folder and let it execute them for you...
        Cucumberish.executeFeatures(inDirectory: "Features", includeTags: nil, excludeTags: nil)
    }
}
