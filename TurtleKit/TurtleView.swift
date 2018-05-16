import UIKit

public enum TurtleViewAxis {
    case horizontal
    case vertical
}

public class TurtleView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        
        backgroundColor = .green
    }
    
    public required init?(coder aDecoder: NSCoder) { fatalError() }
}

class TurtleButton: TurtleView {
    
    private let action: () -> Void
   
    init(title: String, action: @escaping () -> Void) {
        
        self.action = action
        
        super.init()
        
        let label = UILabel.init()
        label.textAlignment = .center
        label.textColor = .white
        label.text = title
        label.pinTo(superView: self, insetBy: 0)
    }
   
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action()
    }
}

class TurtleSetView: TurtleView {
    
    init(views: [TurtleView], axis: TurtleViewAxis) {
        super.init()
        
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
