import UIKit

public enum Turtle {
    case button(title: String, isActive: Bool, action: () -> Void)
    case label(title: String)
    case wrapped(view: UIView)
    case slider(title: String, initialValue: Double, action: (Double) -> Void)
    case textField(initialText: String, action: (String) -> Void)
    indirect case combined(axis: TurtleViewAxis, turtles: [Turtle])
}

public struct Style {
    
    var activeColor = UIColor.gray
    var inactiveColor = UIColor.lightGray
}



public class TurtleRenderer {
    
    public init() { }
    
    var style = Style() {
        didSet {
            viewBuilder.style = style
        }
    }
    
    private var viewBuilder = ViewBuilder()
    
    public func render(turtle: Turtle) -> UIView {
        
        switch turtle {
            
        case .button(let title, let isActive, let action):
            return viewBuilder.makeButton(title: title, isActive: isActive, action: action)

        case .slider(let title, let initialValue, let action):
            return viewBuilder.makeSlider(title: title, initialValue: initialValue, action: action)
            
        case .label(let title):
            return viewBuilder.makeLabel(title: title)
            
        case .wrapped(let view):
            return view
            
        case .textField(let initialText, let action):
            return viewBuilder.makeTextField(initialText: initialText, action: action)
            
        case .combined(let axis, let turtles):
            let tviews = turtles.map { render(turtle: $0) }
            return TurtleSetView(views: tviews, axis: axis)
        }
    }
}


