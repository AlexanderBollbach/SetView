import UIKit
import UIKitHelp

public enum TurtleViewAxis {
    case horizontal
    case vertical
}

public class Button: UIControl {
    
    var action: () -> Void = {}
    
    init() {
       
        super.init(frame: .zero)
      
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    public required init?(coder aDecoder: NSCoder) { fatalError() }
    
    @objc private func tapped() {
        animate()
        action()
    }
    
    private func animate() {
        
        let color = backgroundColor
        let speed = 0.2
        
        UIView.animate(withDuration: speed, animations: { [unowned self] in
            self.backgroundColor = .white
        }) { _ in
            UIView.animate(withDuration: speed, animations: {
                self.backgroundColor = color
            })
        }
    }
}

