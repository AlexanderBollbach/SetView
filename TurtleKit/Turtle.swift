import Foundation

struct Turtle: Equatable {
    
    enum TurtleType {
        case button
        case label(String)
        case list
    }
    
    let key: Int
    let title: String
    let isActive: Bool
    let elementType: TurtleType
    let action: () -> Void
    let children: [Turtle]
    
    init(
        key: Int,
        title: String,
        isActive: Bool = false,
        elementType: TurtleType,
        action: @escaping () -> Void =  {},
        children: [Turtle] = []
        ) {
        
        self.key = key
        self.title = title
        self.isActive = isActive
        self.elementType = elementType
        self.action = action
        self.children = children
    }
    
    static func ==(lhs: Turtle, rhs: Turtle) -> Bool {
        return lhs.key == rhs.key && lhs.isActive == rhs.isActive
    }
}

extension Turtle: Hashable {
    var hashValue: Int {
        return key
    }
}
