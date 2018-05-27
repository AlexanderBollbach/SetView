import UIKit

public enum Turtle {
    case button(title: String, isActive: Bool, action: () -> Void)
    case label(title: String)
    case wrappedView(view: UIView)
    case slider(title: String, initialValue: Double, valueUpdated: (Double) -> Void)
    case textField(initialText: String, textChanged: (String) -> Void)
    indirect case combined(axis: TurtleViewAxis, turtles: [Turtle])
    
}

extension Turtle {
  
    public func render() -> UIView {
        
        switch self {
        case .button(let title, let isActive, let action):
            return TurtleView(title: title, isActive: isActive, action: action)
            
        case .slider(let title, let initialValue, let valueUpdated):
            return SliderWithText.init(text: title, initialValue: initialValue, callback: valueUpdated)
            
        case .label(let title):
            let l = UILabel()
            l.text = title
            return l
        case .wrappedView(let view):
            return view
        case .textField(let initialText, let textChanged):
            let textField = UITextField.init()
            textField.text = initialText
            textField.addTargetClosure { tf in
                textChanged(tf.text ?? "")
            }
            return textField
        case .combined(let axis, let turtles):
            let tviews = turtles.map { $0.render() }
            return TurtleSetView.init(views: tviews, axis: axis)
        }
    }
    
}
