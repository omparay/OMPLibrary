import XCTest
@testable import OMPLibrary

final class OMPLibraryTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(OMPLibrary().text, "Hello, World!")
    }

    func testBool(){
        XCTAssertTrue(Bool.yes)
        XCTAssertFalse(Bool.no)
    }

    static var allTests = [
        ("testExample", testExample),
        ("testBool",testBool)
    ]
}
