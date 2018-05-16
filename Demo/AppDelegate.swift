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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let t = Turtle.combined(
            axis: .horizontal,
            turtles: [
                Turtle.button(title: "foo") {
                    print("foo")
                },
                Turtle.button(title: "bar") {
                    print("bar")
                },
                ]
        )
        
        let v = t.render()
        v.pinTo(superView: view, insetBy: 0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
