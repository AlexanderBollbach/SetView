import UIKit
import UIKitHelp

class SliderWithText: UIView {
    
    var value: Double {
        didSet { slider.value = value }
    }
    
    private let slider = Slider()
    
    init(text: String, initialValue: Double = 0, callback: @escaping (Double) -> Void) {
        
        value = initialValue
        
        super.init(frame: .zero)
        
        let label = UILabel()
        label.text = text
        label.pinTo(superView: self)
       
        slider.value = value
        slider.valueChanged = { callback($0) }
        slider.pinTo(superView: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches moved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("touches end")
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
}
