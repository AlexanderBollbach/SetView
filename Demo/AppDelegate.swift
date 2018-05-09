import UIKit

import TurtleKit

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
    
    let turtleView = TurtleView()
    let r = BruteForceRenderer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        turtleView.pinTo(superView: view, insetBy: 0)
        
        
        
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let elements = [
            Turtle(key: 1, title: "one", elementType: .label("test")),
            Turtle(key: 2, title: "two", elementType: .label("test")),
            ]
        
        r.render(turtles: elements, in: turtleView)
    }

}
