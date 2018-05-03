import UIKit

class SetView: UIView {
    
    let key: Int
   
    private let stackView = UIStackView()
    private var elements = [Element]()
    
    init(key: Int) {
        self.key = key
        super.init(frame: .zero)
        addSubview(stackView)
    }
    
    func render(elements: [Element]) {
        
        let oldElement = self.elements
        
        self.elements = elements
     
        let update = diffElements(old: oldElement, new: elements)
        
        for el in update.remove {
            remove(element: el)
        }
        
        for el in update.add {
            insert(element: el)
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stackView.frame = bounds
    }
}

// stack view management functions
extension SetView {
    
    func insert(element: Element) {
        
        let setView = SetView(key: element.Key)
        
        for i in 0..<stackView.arrangedSubviews.count {
            
            let curr = (stackView.arrangedSubviews[i] as! SetView).key
            
            if i < stackView.arrangedSubviews.count - 1 {
            
                let next = (stackView.arrangedSubviews[i + 1] as! SetView).key
                
                
                if element.Key > curr && element.Key < next {
                    stackView.insertArrangedSubview(setView, at: i)
                }
            }
            
        }
        
        stackView.addArrangedSubview(setView)
    }
    
    func remove(element: Element) {
        
        guard let v = (stackView.arrangedSubviews.filter { ($0 as! SetView).key == element.Key }).first else { fatalError() }
        stackView.removeArrangedSubview(v)
        v.removeFromSuperview()
    }
}


struct ElementUpdate {
    let add: [Element]
    let remove: [Element]
}


func diffElements(old: [Element], new: [Element]) -> ElementUpdate {
    
    let elementsToAdd = Set(new).subtracting(Set(old))
    let oldElementsToDelete = Set(old).subtracting(Set(new))
    
    return ElementUpdate(add: Array(elementsToAdd), remove: Array(oldElementsToDelete))
}



