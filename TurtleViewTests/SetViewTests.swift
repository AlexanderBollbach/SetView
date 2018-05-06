import XCTest
@testable import SetView

class OptionsViewTests: XCTestCase {

    func testExample() {
    
        
        
        let sut = SetView(key: 0)
        
        let elements = [
            Element(id: 1, title: "one"),
            Element(id: 2, title: "two"),
            ]
        
        sut.render(elements: elements)
        
        let newElements = [
            Element(id: 2, title: "two"),
            Element(id: 3, title: "three"),
            ]
        
        
        sut.render(elements: newElements)
        
        XCTAssert(sut.subviews[0].subviews.count == 2)
    }
    

}
