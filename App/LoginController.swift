import Cocoa
import CCNNavigationController

public protocol NetworkServiceProtocol {
    func login(username: String) -> String
}

public protocol AlertProtocol {
    func show(alert: NSAlert)
}

public class NetworkService: NetworkServiceProtocol {
    public init() {}
    public func login(username: String) -> String {
        "success"
    }
}

public class PushSegue: NSStoryboardSegue {
    public override func perform() {
        if let from = sourceController as? NSViewController,
            let to = destinationController as? NSViewController {
            from.navigationController.pushViewController(to, animated: true)
        }
    }
}

class NavContainer: NSViewController {
//    var rootController: NSViewController!
//    override func awakeAfter(using coder: NSCoder) -> Any? {
//        performSegue(withIdentifier: "root", sender: nil)
//        return CCNNavigationController(rootViewController: rootController)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "root", sender: nil)
    }
    @IBAction func pop(sender: Any?) {
        if let nav = children.first as? CCNNavigationController {
            nav.popViewController(animated: true)
        }
    }

}

extension CCNNavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
//        print(parent!)
//        performSegue(withIdentifier: "root", sender: nil)
    }
    open override func awakeAfter(using coder: NSCoder) -> Any? {
        CCNNavigationController(rootViewController: nil)
//        self.copy()
    }
}

public class RootSegue: NSStoryboardSegue {
    public override init(identifier: NSStoryboardSegue.Identifier, source sourceController: Any, destination destinationController: Any) {
        super.init(identifier: identifier, source: sourceController, destination: destinationController)
    }
    public override func perform() {
//        if let from = sourceController as? CCNNavigationController,
//            let to = destinationController as? NSViewController {
//            from.setViewControllers([to], animated: true)
//        }
        if let from = sourceController as? NavContainer,
            let to = destinationController as? NSViewController,
            let nav = from.children.first as? CCNNavigationController {
            nav.setViewControllers([to], animated: false)
        }
    }
}

public class WindowWithNav: NSWindowController {
    var contentVC: NSViewController!
    public override func awakeFromNib() {
        super.awakeFromNib()
        
//        window!.contentViewController = CCNNavigationController(rootViewController: contentViewController)
    }
    public override func windowDidLoad() {
        super.windowDidLoad()
        contentVC = contentViewController
        contentVC.view.removeFromSuperview()
        
        contentViewController = CCNNavigationController(rootViewController: contentVC)
        contentViewController?.view.addSubview(contentVC.view)
//        window?.contentView = contentViewController?.view
    }
//    open override var contentViewController: NSViewController? {
//        didSet {
//            contentViewController = CCNNavigationController(rootViewController: contentViewController)
//        }
//    }
}

public class LoginController: NSViewController {
//    public override func awakeAfter(using coder: NSCoder) -> Any? {
//        _ = self.view
//        return CCNNavigationController(rootViewController: self)
////        return self
////        return super.awakeAfter(using: coder)
//    }
    @IBOutlet weak var environmentButton: NSPopUpButton!
    @IBOutlet weak var usernameField: NSTextField!
    @IBOutlet weak var passwordField: NSSecureTextField!
    public var networkService: NetworkServiceProtocol = NetworkService()
    public var alertService: AlertProtocol!
    @IBAction public func connectAction(_ sender: NSButton) {
        if networkService.login(username: "sparta@example.com") == "success" {
//            sender.window?.close()
            performSegue(withIdentifier: "to download", sender: self)
//            let next: NSViewController = storyboard!.instantiateController(identifier: "loading")
//            navigationController.pushViewController(next, animated: true)
        } else {
            alertService.show(alert: NSAlert())
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
