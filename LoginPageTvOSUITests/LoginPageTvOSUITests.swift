//
//  LoginPageTvOSUITests.swift
//  LoginPageTvOSUITests
//
//  Created by Vibhuti on 17/10/18.
//  Copyright © 2018 Vibhuti. All rights reserved.
//

import XCTest

class LoginPageTvOSUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUernameExists() {
        
        let myTextField = XCUIApplication().textFields["user_name"]
        XCTAssert(myTextField.exists)
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testUernameisEmpty() {
        
        let myTextField = XCUIApplication().textFields["user_name"]
        XCTAssert(myTextField.hasFocus)
        XCUIRemote.shared.press(.select)
        myTextField.typeText("")
        XCUIRemote.shared.press(.select)
        XCTAssert(myTextField.exists)
        XCTAssert(myTextField.label.isEmpty)
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLoginBtnExists() {
        
        let mybutton = XCUIApplication().buttons["login_button"]
        XCTAssert(mybutton.exists)
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    //executes by setting breakpoints or  when focus is on particluar Username textfield and login button
    func testLoginBtnClick() {
        
        let myTextField = XCUIApplication().textFields["user_name"]
        XCTAssert(myTextField.hasFocus)
        XCUIRemote.shared.press(.select)
        myTextField.typeText("string")
        
        XCUIRemote.shared.press(.down)
        XCUIRemote.shared.press(.down)
        XCUIRemote.shared.press(.down)
        XCUIRemote.shared.press(.select)
        
        let mybutton = XCUIApplication().buttons["login_button"]
        XCTAssert(mybutton.exists)

        XCUIRemote.shared.press(.down)
        if(mybutton.hasFocus){
            XCUIRemote.shared.press(.select)

       }
        
        
     
      //  let alert =  XCUIApplication().accessibilityLabel?["label_accesibilty"]
    //    XCUIRemote.shared.press(.select)
        //
        //        // Waiting for alert to appear
             //  _ = alert.waitForExistence(timeout: TimeInterval(10))
              //  XCTAssert(alert.hasFocus)
        
        //  XCTAssertEqual(alert.label, "Success")
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    
}
