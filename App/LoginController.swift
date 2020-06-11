import Cocoa

public class LoginController: NSViewController {
    @IBOutlet weak var environmentButton: NSPopUpButton!
    @IBOutlet weak var usernameField: NSTextField!
    @IBOutlet weak var passwordField: NSSecureTextField!
    @IBAction public func connectAction(_ sender: NSButton) {
        sender.window?.close()
    }
}
