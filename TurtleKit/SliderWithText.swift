import UIKit
import UIKitHelp


struct ViewBuilder {
    
    var style: Style = Style()
    
    func makeLabel(title: String) -> UILabel {
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = title
        
        return label
    }
    
    func makeTextField(initialText: String, action: @escaping (String) -> Void) -> UIView {
        
        let textField = UITextField.init()
        textField.text = initialText
        textField.addTargetClosure { tf in
            action(tf.text ?? "")
        }
    
        return textField
    }
    
    func makeSlider(title: String, initialValue: Double, action: @escaping (Double) -> Void) -> UIView {
        
        let v = UIView()
        addLabel(title: title, to: v)
        
        v.backgroundColor = style.inactiveColor
        
        let slider = Slider(fillColor: style.activeColor, orientation: .horizontal, initialValue: initialValue, action: action)
        slider.value = initialValue
        slider.valueChanged = action
        
        slider.pinTo(superView: v)
        
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

