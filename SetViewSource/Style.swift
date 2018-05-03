import Foundation

struct SetViewStyle {
    
    enum Distribution {
        case evenSpacing
        case amount(Int)
    }
    
    enum Direction {
        case vertical
        case horizontal
    }
    
    var distribution: Distribution
    var direction: Direction
    var spacing: Double
    var insets: Double
    
    init(
        distribution: Distribution = .evenSpacing,
        direction: Direction = .vertical,
        spacing: Double = 0.0,
        insets: Double = 0.0
        ) {
        
        self.distribution = distribution
        self.direction = direction
        self.spacing = spacing
        self.insets = insets
    }
}
