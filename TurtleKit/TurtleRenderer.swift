import UIKit

protocol TurtleRenderer {
    func render(turtles: [Turtle], in turtleView: TurtleView)
}

class BruteForceRenderer: TurtleRenderer {
    
    func render(turtles: [Turtle], in turtleView: TurtleView) {
        
        for turtle in turtles {
            
            let v = TurtleView(element: turtle)
            let r = Double(arc4random() / UInt32.max)
            v.backgroundColor = UIColor(red: CGFloat(r), green: 1, blue: 1, alpha: 1)
            turtleView.insert(v)
            render(turtles: turtle.children, in: v)
        }
    }
}
//
//class FastTurtleRenderer: TurtleRenderer {
//
//    let turtleView: TurtleView
//
//    var currentTurtles = [Turtle]()
//
//    init(tutleView: TurtleView) {
//        self.turtleView = tutleView
//    }
//
//    private struct ViewUpdate {
//        let add: [Turtle]
//        let remove: [Turtle]
//    }
//
//    func render(turtles: [Turtle], in turtleView: TurtleView) {
//
//        let update = diff(old: currentTurtles, new: turtles)
//
//        self.currentTurtles = turtles
//
////        for turtle in update.remove {
////        }
//    }
//
//    private func diff(old: [Turtle], new: [Turtle]) -> ViewUpdate {
//
//        let elementsToAdd = Set(new).subtracting(Set(old))
//        let oldElementsToDelete = Set(old).subtracting(Set(new))
//
//        return ViewUpdate(add: Array(elementsToAdd), remove: Array(oldElementsToDelete))
//    }
//}
