@testable import OMPLibrary
import XCTest

class BoolExtensionsTests: XCTestCase {

    func testBool(){
        XCTAssertTrue(Bool.yes)
        XCTAssertFalse(Bool.no)
    }

    static var allTests = [
        ("testBool",testBool),
    ]
}