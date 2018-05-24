import UIKit
import UIKitHelp

public enum TurtleViewAxis {
    case horizontal
    case vertical
}

public class TurtleView: UIView {
    
    private let action: () -> Void
    
    init(
        title: String,
        isActive: Bool,
        action: @escaping () -> Void
        ) {
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = title
        
        self.action = action
        
        super.init(frame: .zero)
        
        label.pinTo(superView: self)
        backgroundColor = isActive ? UIColor.darkGray : UIColor.lightGray
    }
    
    public required init?(coder aDecoder: NSCoder) { fatalError() }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action()
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
