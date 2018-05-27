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
    
    var demoView: UIView!
    
    let layers = [("layer1", 0), ("layer2", 1)]
    var sel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        render()
        
    }
    
    func render() {
        
        view.subviews.forEach { $0.removeFromSuperview() }
        
        Turtle.combined(
            axis: .vertical,
            turtles:
            layers.map { layer in
                Turtle.view(
                    title: layer.0,
                    isActive: layer.1 == sel,
                    action: { [unowned self] in
                        self.sel = layer.1
                        self.render()
                    }
                )
            }
            
            )
            .render()
            .pinTo(superView: view)
    }
    
}
