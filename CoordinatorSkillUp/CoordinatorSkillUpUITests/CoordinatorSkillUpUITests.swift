//
//  CoordinatorSkillUpUITests.swift
//  CoordinatorSkillUpUITests
//
//  Created by Sergey Pohrebnuak on 4/9/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import XCTest

class CoordinatorSkillUpUITests: XCTestCase {
    
    var app: XCUIApplication = XCUIApplication()

    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSelectCity() {
        app.buttons["Select another city"].tap()
        guard app.tables.cells.staticTexts["Kuiv"].exists else { return }
        
        app.tables.cells.staticTexts["Kuiv"].tap()
        XCTAssertTrue(app.otherElements["userProfileViewController"].exists)
    }
    
    func testSelectRegionAndCity() {
        app.buttons["Select another city"].tap()
        guard app.tables.cells.staticTexts["Kharkiv reg"].exists else { return }
        
        app.tables.cells.staticTexts["Kharkiv reg"].tap()
        app.tables.cells.staticTexts["3"].tap()
        XCTAssertFalse(app.tables.cells.count > 100)
        XCTAssertTrue(app.otherElements["userProfileViewController"].exists)
    }
    
    func testUniversalTestForAllFlow() {
        app.buttons["Second"].tap()
        app.buttons["Segue to user profile flow"].tap()
        
        XCTAssertTrue(app.buttons["Select another city"].isHittable)//check user can tap on button yes or no
        //make screenshot - test navigator -> right tap mous -> jump to result -> find attach (Screenshot)
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "My Great Screenshot"
        attachment.lifetime = .keepAlways
        add(attachment)
        
        app.buttons["Select another city"].tap()//tap on button
        XCTAssertTrue(app.buttons["Select another city"].exists)//check has button with display name "Select another city"
        XCTAssertTrue(app.buttons["Select another city"].isEnabled)//check is enable button
        if app.tables.cells.staticTexts["Kuiv"].exists {
            app.tables.cells.staticTexts["Kuiv"].tap()
            XCTAssertTrue(app.otherElements["userProfileViewController"].exists)
        } else {
            XCTAssertTrue(app.navigationBars["Magic City list"].exists)//check navigation bar title
            app.tables.cells.staticTexts["Kharkiv reg"].tap()//tap on cell
            app.tables.cells.staticTexts["3"].tap()//tap on cell
            XCTAssertFalse(app.tables.cells.count > 100)//check count cell in table view
            XCTAssertTrue(app.otherElements["userProfileViewController"].exists)//check type view controller (should improvment accessibilityIdentifier in view controller)
        }
    }
    
    func testTabBar() {
        app.buttons["Second"].tap()
    }

}
