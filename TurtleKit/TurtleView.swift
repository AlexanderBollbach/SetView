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
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action()
    }
    
    @objc private func tapped() {
        action()
    }
}

class TurtleSetView: UIView {
    
    init(views: [UIView], axis: TurtleViewAxis) {
        super.init(frame: .zero)
        
        let sv = UIStackView.init(arrangedSubviews: views)
        sv.distribution = .fillEqually
        
        switch axis {
        case .horizontal:
            sv.axis = .horizontal
        case .vertical:
            sv.axis = .vertical
        }
        
        sv.pinTo(superView: self, insetBy: 0)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
}
