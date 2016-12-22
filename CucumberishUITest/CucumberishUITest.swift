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
        //A closure that will be executed just before executing any of your features
        beforeStart { () -> Void in
            
        }

        // MARK: - SignIn
        
        Given("ID is Jacky") { (args, userInfo) -> Void in
            
            let app = XCUIApplication()
            app.launch()
            
            let idTextField = app.textFields["ID"]
            idTextField.tap()
            idTextField.typeText("Jacky")
            
            And("Password is 12345678") { (args, userInfo) -> Void in
                let passwordTextField = app.textFields["Password"]
                passwordTextField.tap()
                passwordTextField.typeText("12345678")
            }
            
            When("tape SignIn") { (args, userInfo) -> Void in
                app.buttons["SignIn"].tap()
                XCTAssertTrue(false)
            }
            
            Then("dismiss SignIn Page") { (args, userInfo) -> Void in
                
                let navBar = app.navigationBars.staticTexts["SignIn"]
                XCTAssertFalse(navBar.exists)
            }
            
            // MARK: - Calculate balance
            
            // Example1
            Given("balance is 1000.00") { (args, userInfo) -> Void in
                
                let capitalTextField = app.textFields["Capital"]
                capitalTextField.tap()
                capitalTextField.typeText("1000")
                
                And("annual interest rate is 0.05") { (args, userInfo) -> Void in
                    let interestTextField = app.textFields["Interest"]
                    interestTextField.tap()
                    interestTextField.typeText("0.05")
                }
                
                When("calculate interest") { (args, userInfo) -> Void in
                    app.buttons["Calculate"].tap()
                }
                
                Then("balance becomes 1050.00") { (args, userInfo) -> Void in
                    
                    XCTAssertEqual(app.staticTexts["Balance"].label, "1050.0")
                }
            }
            
            // Example2
            Given("balance is 2000.00") { (args, userInfo) -> Void in
                
                let capitalTextField = app.textFields["Capital"]
                capitalTextField.tap()
                
                capitalTextField.buttons["Clear text"].tap()
                capitalTextField.typeText("2000")
                
                And("annual interest rate is 0.03") { (args, userInfo) -> Void in
                    let interestTextField = app.textFields["Interest"]
                    interestTextField.tap()
                    
                    interestTextField.buttons["Clear text"].tap()
                    interestTextField.typeText("0.03")
                }
                
                When("calculate interest") { (args, userInfo) -> Void in
                    app.buttons["Calculate"].tap()
                }
                
                Then("balance becomes 2060.00") { (args, userInfo) -> Void in
                    
                    XCTAssertEqual(app.staticTexts["Balance"].label, "2060.0")
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
