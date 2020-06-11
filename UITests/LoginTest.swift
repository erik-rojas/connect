import XCTest

class LoginTest: XCTestCase {

    let app = XCUIApplication()
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launchArguments = [
            "-moveToApplicationsFolderAlertSuppress", "YES",
        ]
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testLogin() throws {
        let window = XCUIApplication().windows["Window"]
        let popUpButton = window.children(matching: .popUpButton).element
        popUpButton.click()
        popUpButton.menuItems["localhost"].click()
        
        let textField = window.children(matching: .textField).element
        textField.click()
        textField.typeText("superuser@example.com")
        let passwordField = window.children(matching: .secureTextField).element
        passwordField.click()
        passwordField.typeText("password123")

        window.buttons["connect"].click()
        window.waitToDisappear()
    }
}
