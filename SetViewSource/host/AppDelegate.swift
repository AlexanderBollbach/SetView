import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = DemoViewController(nibName: nil, bundle: nil)
        window?.makeKeyAndVisible()
        return true
    }
}

class DemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sv = SetView(key: 0)
        
        let elements = [
            Element(id: 1, title: "one"),
            Element(id: 2, title: "two"),
        ]
        
        sv.render(elements: elements)
        
        let newElements = [
            Element(id: 2, title: "two"),
            Element(id: 3, title: "three"),
            ]
        
        sv.render(elements: newElements)
    }
}
