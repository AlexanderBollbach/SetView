import UIKit
import UIKitHelp

struct ViewBuilder {
    
    var style: Style = Style()
    
    func makeLabel(title: String) -> UILabel {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.text = title
        
        return label
    }
    
    func makeTappableView(_ view: UIView, action: @escaping () -> Void) -> UIView {
        
        let b = Button()
        view.isUserInteractionEnabled = false
        view.pinTo(superView: b)
        b.action = action
        
        return b
    }
    
    func filled(axis: TurtleViewAxis, views: [(UIView, Double)]) -> UIView {
        
        var views = views

        let sv = UIStackView.init(arrangedSubviews: views.map { $0.0 })
        sv.distribution = .fill
        
        switch axis {
        case .horizontal:
            sv.axis = .horizontal
        case .vertical:
            sv.axis = .vertical
        }
        
        // calculate explicit fills total
        let total = views.map { $0.1 }.reduce(0) { (result, next) -> Double in
            let r = result + next
            return r
        }
        // how many were explicit
        let numExplicit = views.map { $0.1 }.filter { $0 != 0 }.count
        
        let implicitFill = (1 - total) / Double(numExplicit)
        
        // fill in zeros
        views = views.map { return ($0.0, $0.1 == 0 ? implicitFill : $0.1) }
        
        views.forEach { (view, fill) in
            
            var anchor: NSLayoutDimension!
            var toAnchor: NSLayoutDimension!
            
            switch axis {
            case .horizontal:
                anchor = view.widthAnchor
                toAnchor = sv.widthAnchor
            case .vertical:
                anchor = view.heightAnchor
                toAnchor = sv.heightAnchor
            }
            
            anchor.constraint(equalTo: toAnchor, multiplier: CGFloat(fill)).isActive = true
        }
        
        return sv
    }
    
    func combined(axis: TurtleViewAxis, views: [UIView]) -> UIView {
        
        let sv = UIStackView.init(arrangedSubviews: views)
        sv.distribution = .fillEqually
        
        switch axis {
        case .horizontal:
            sv.axis = .horizontal
        case .vertical:
            sv.axis = .vertical
        }
        
        return sv
    }
    
    func makeTextField(initialText: String, action: @escaping (String) -> Void) -> UIView {
        
        let textField = UITextField.init()
        textField.backgroundColor = style.inactiveColor
        textField.text = initialText
        textField.addTargetClosure { tf in
            action(tf.text ?? "")
        }
    
        return textField
    }
    
    func makeSlider(title: String, initialValue: Double, action: @escaping (Double) -> Void) -> UIView {
        
        let v = UIView()
        v.backgroundColor = style.inactiveColor
        
        let slider = Slider(fillColor: style.activeColor, orientation: .horizontal, initialValue: initialValue, action: action)
        slider.value = initialValue
        slider.valueChanged = action
        
        slider.pinTo(superView: v)
        
        addLabel(title: title, to: v)
        
        return slider
    }
    
    func makeButton(title: String, isActive: Bool, action: @escaping () -> Void) -> UIView {
        
        let v = Button()
        v.action = action
        
        v.backgroundColor = isActive ? style.activeColor : style.inactiveColor
        
        addLabel(title: title, to: v)
        
        return v
    }
    
    func addLabel(title: String, to view: UIView) {
        makeLabel(title: title).pinTo(superView: view)
    }
}

