import UIKit

class TurtleView: UIView {
  
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
//        sv.alignment = .center
        return sv
    }()
    
    init() {
        super.init(frame: .zero)
        stackView.pinTo(superView: self, insetBy: 0)
    }
    
    init(element: Turtle) {
        super.init(frame: .zero)
        
        switch element.elementType {
        
        case .label(let text):
            let label = UILabel()
            label.pinTo(superView: self, insetBy: 0)
            label.text = text
            
        default:
            fatalError()
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }

    
    func insert(_ view: TurtleView) {
    
        stackView.addArrangedSubview(view)
    }
    
    func remove(_ view: TurtleView) {
        
        stackView.removeArrangedSubview(view)
        view.removeFromSuperview()
    }
}
