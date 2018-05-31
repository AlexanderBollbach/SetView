import UIKit

class Slider: UIView {
    
    enum Orientation {
        case vertical
        case horizontal
    }
    
    var orientation: Orientation = .horizontal
    
    var valueChanged: (Double) -> Void = { _ in }
    
    var value: Double = 0.0 { didSet { setNeedsDisplay() } }
    
    let fillColor: UIColor
    
    init(fillColor: UIColor, orientation: Orientation = .horizontal, initialValue: Double, action: @escaping (Double) -> Void) {
        self.fillColor = fillColor
        self.valueChanged = action
        self.value = initialValue
        self.orientation = orientation
        super.init(frame: .zero)
        self.isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        switch orientation {
            
        case.vertical:
            guard let y = touches.first?.location(in: self).y else { return }
            self.value = Double(y / bounds.size.height)
            
        case .horizontal:
            guard let x = touches.first?.location(in: self).x else { return }
            self.value = Double(x / bounds.size.width)
            
        }
        
        valueChanged(self.value)
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touches ended in slider")
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        
        ctx.clear(rect)
        
        var scaled: CGFloat!
        
        switch orientation {
        case .vertical:
            scaled =  CGFloat(value) * bounds.size.height
        case .horizontal:
            scaled =  CGFloat(value) * bounds.size.width
        }
        
        ctx.setFillColor(self.fillColor.cgColor)
        
        switch orientation {
        case .vertical:
            ctx.fill(CGRect.init(x: 0,
                                 y: 0,
                                 width: bounds.size.width,
                                 height: scaled))
        case .horizontal:
            ctx.fill(CGRect.init(x: 0,
                                 y: 0,
                                 width: scaled,
                                 height: bounds.size.height))
        }
    }
}


