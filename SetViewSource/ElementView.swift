import UIKit

class ElementView : UIView {}

class BasicElementView: ElementView {
    
    let title: String
    let isActive: Bool
    var action: () -> Void = {}
    
    init(title: String, isActive: Bool, action: @escaping () -> Void) {
        self.title = title
        self.isActive = isActive
        self.action = action
        
        super.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = isActive ? .yellow : .green
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        action()
    }
}
