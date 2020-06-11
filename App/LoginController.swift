import Cocoa

public protocol NetworkServiceProtocol {
    func login(username: String)
}

public class LoginController: NSViewController {
    @IBOutlet weak var environmentButton: NSPopUpButton!
    @IBOutlet weak var usernameField: NSTextField!
    @IBOutlet weak var passwordField: NSSecureTextField!
    public var networkService: NetworkServiceProtocol!
    @IBAction public func connectAction(_ sender: NSButton) {
        sender.window?.close()
        networkService.login(username: "sparta@example.com")
    }
}
