import UIKit

public struct FillTurtle {
    let turtle: Turtle
    let fill: Double
    
    public init(turtle: Turtle, fill: Double = 0) {
        self.turtle = turtle
        self.fill = fill
    }
}

public struct FillView {
    let view: UIView
    let fill: Double
    
    public init(view: UIView, fill: Double = 0) {
        self.view = view
        self.fill = fill
    }
}

public enum Turtle {
    case button(title: String, isActive: Bool, action: () -> Void)
    case tappableView(view: UIView, action: () -> Void)
    case label(title: String)
    case wrapped(view: UIView)
    case slider(title: String, initialValue: Double, action: (Double) -> Void)
    case textField(initialText: String, action: (String) -> Void)
    indirect case combined(axis: TurtleViewAxis, turtles: [Turtle])
    indirect case fillTurtles(axis: TurtleViewAxis, fillTurtles: [FillTurtle])
    indirect case fillViews(axis: TurtleViewAxis, fillViews: [FillView])
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
            
        case .tappableView(let view, let action):
            return viewBuilder.makeTappableView(view, action: action)

        case .slider(let title, let initialValue, let action):
            return viewBuilder.makeSlider(title: title, initialValue: initialValue, action: action)
            
        case .label(let title):
            return viewBuilder.makeLabel(title: title)
            
        case .wrapped(let view):
            return view
            
        case .textField(let initialText, let action):
            return viewBuilder.makeTextField(initialText: initialText, action: action)
            
        case .combined(let axis, let turtles):
            return viewBuilder.combined(axis: axis, views: turtles.map { render(turtle: $0) })
            
        case .fillTurtles(let axis, let fillTurtles):
            return viewBuilder.filled(
                axis: axis,
                views: fillTurtles.map { (render(turtle: $0.turtle), $0.fill) }
            )
            
        case .fillViews(let axis, let views):
            return viewBuilder.filled(
                axis: axis,
                views: views.map { ($0.view, $0.fill) }
            )
        }
        
        
    }
}


