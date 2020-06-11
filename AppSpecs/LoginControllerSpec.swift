import Nimble
import Quick
import SpartaConnect

class MockNetworkService: NetworkServiceProtocol {
    var didLogin: String?
    func login(username: String) {
        didLogin = username
    }
}

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
                var mockNetwork: MockNetworkService!
                beforeEach {
                    mockNetwork = .init()
                    subject.networkService = mockNetwork
                }
                it("should call network with username and password") {
                    subject.connectAction(.init())
                    expect(mockNetwork.didLogin) == "sparta@example.com"
                }
            }
        }
    }
}
