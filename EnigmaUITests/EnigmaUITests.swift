//
//  EnigmaUITests.swift
//  EnigmaUITests
//
//

import XCTest

class EnigmaUITests: XCTestCase {
    
    var app: XCUIApplication!
    var encryptionView: XCUIElement!
    var subStackView: XCUIElement!
    var loadedKeysLbl: XCUIElement!
    var messageTxtView: XCUIElement!
    var encryptDecryptCtrl: XCUIElement!
    var encryptDecryptButton: XCUIElement!
    var processedMessageTxtView: XCUIElement!
    
    let days = Set(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"])


    override func setUp() {
        app = XCUIApplication()
        encryptionView = app.otherElements[Identifiers.encryptionView]
        subStackView = app.otherElements[Identifiers.subStackView]
        loadedKeysLbl = app.staticTexts[Identifiers.loadedKeysLbl]
        messageTxtView = app.textViews[Identifiers.messageTxtView]
        encryptDecryptCtrl = app.segmentedControls[Identifiers.encryptDecryptSegCtrl]
        encryptDecryptButton = app.buttons[Identifiers.encryptDecryptButton]
        processedMessageTxtView = app.textViews[Identifiers.processedMessageTxtView]
        
        continueAfterFailure = false
        app.launchArguments.append("--UITests")
        app.launch()
    }

    override func tearDown() {
        processedMessageTxtView = nil
        encryptDecryptButton = nil
        encryptDecryptCtrl = nil
        messageTxtView = nil
        loadedKeysLbl = nil
        subStackView = nil
        encryptionView = nil
        app = nil
        super.tearDown()
    }

    func test_encryptionViewExists() {
        XCTAssertTrue(encryptionView.exists, "Failed to display encryptionView")
        XCTAssertTrue(subStackView.exists, "Failed to display subStackView")
        XCTAssertTrue(loadedKeysLbl.exists, "Failed to display todays loaded keys label")
        XCTAssertTrue(messageTxtView.exists, "Failed to display messageTxtView")
        XCTAssertTrue(encryptDecryptCtrl.exists, "Failed to display encryptDecryptCtr segmented control")
        XCTAssertTrue(encryptDecryptButton.exists, "Failed to display encryptDecryptButton")
        XCTAssertTrue(processedMessageTxtView.exists, "Failed to display processedMessageTxtView")
    }
    
    func test_loadedKeysLabel_containsDayName() {
        let trimmedLabel = loadedKeysLbl.label.replacingOccurrences(of: "Keys loaded today: ", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        print(trimmedLabel)
        XCTAssertTrue(days.contains(trimmedLabel), "Loaded keys label does not contain day name ")
    }
    
    func test_encryptDecryptButton_changesTitle() {
        XCTAssertEqual(encryptDecryptButton.label, "ENCRYPT")
        print(encryptDecryptButton.label)
        encryptDecryptCtrl.buttons["DECRYPT"].tap()
        print(encryptDecryptButton.label)
        XCTAssertEqual(encryptDecryptButton.label, "DECRYPT")        
    }
    
    func test_encryptingMessageWorks() {
        messageTxtView.tap()
        messageTxtView.typeText("onetwothree")
        encryptDecryptButton.tap()
        let originalCount = (messageTxtView.value as! String).count
        let processedCount = (processedMessageTxtView.value as! String).count
        
        XCTAssertEqual(originalCount * 3, processedCount, "Encrypting does not work correctly")
    }
    
    func test_decryptingMessageWorks() {
        messageTxtView.tap()
        messageTxtView.typeText("onetwothree")
        encryptDecryptButton.tap()
        let original = messageTxtView.value as! String
        var processed = processedMessageTxtView.value as! String
        
        messageTxtView.tap()
        messageTxtView.doubleTap()
        app.menuItems["Cut"].tap()
        messageTxtView.typeText(processed)
        encryptDecryptCtrl.buttons["DECRYPT"].tap()
        encryptDecryptButton.tap()
        processed = processedMessageTxtView.value as! String
        
        XCTAssertEqual(processed, original, "Decryption failed")
    }
}
