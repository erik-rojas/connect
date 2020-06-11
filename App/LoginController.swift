import Cocoa

class LoginController: NSViewController {
    @IBOutlet weak var environmentButton: NSPopUpButton!
    @IBOutlet weak var usernameField: NSTextField!
    @IBOutlet weak var passwordField: NSSecureTextField!
    @IBAction func connectAction(_ sender: NSButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
