import Nimble
import Quick
import SpartaConnect

class LoginControllerSpec: QuickSpec {
    override func spec() {
        describe("LoginController") {
            var subject: LoginController!
            beforeEach {
                subject = .init()
            }
            context("connectAction") {
                class MockWindow: NSWindow {
                    var didClose = false
                    override func close() {
                        didClose = true
                    }
                }
                var window: MockWindow!
                beforeEach {
                    window = .init()
                }
                it("should close the window") {
                    let button = NSButton()
                    window.contentView = button
                    subject.connectAction(button)
                    expect(window.didClose) == true
                }
            }
        }
    }
}
