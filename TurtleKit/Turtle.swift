import UIKit

public enum Turtle {
    case button(title: String, action: () -> Void)
    indirect case combined(axis: TurtleViewAxis, turtles: [Turtle])
    
}

extension Turtle {
  
    public func render() -> TurtleView {
        
        switch self {
        case .button(let title, let action):
            return TurtleButton.init(title: title, action: action)
        case .combined(let axis, let turtles):
            let tviews = turtles.map { $0.render() }
            return TurtleSetView.init(views: tviews, axis: axis)
        }
    }
    
}
