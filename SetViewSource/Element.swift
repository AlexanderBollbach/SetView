import Foundation

struct Element: Equatable {
    
    enum ElementType {
        case basic
        case set
    }
    
    let Key: Int
    let title: String
    let isActive: Bool
    let elementType: ElementType
    let action: () -> Void
    let children: [Element]
    
    init(
        id: Int,
        title: String,
        isActive: Bool = false,
        elementType: ElementType = .basic,
        action: @escaping () -> Void =  {},
        children: [Element] = []
        ) {
        
        self.Key = id
        self.title = title
        self.isActive = isActive
        self.elementType = elementType
        self.action = action
        self.children = children
    }
    
    static func ==(lhs: Element, rhs: Element) -> Bool {
        return lhs.Key == rhs.Key && lhs.isActive == rhs.isActive
    }
}

extension Element: Hashable {
    var hashValue: Int {
        return Key
    }
}
