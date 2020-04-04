import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OMPLibraryTests.allTests),
        testCase(BoolExtensionsTests.allTests),
    ]
}
#endif
