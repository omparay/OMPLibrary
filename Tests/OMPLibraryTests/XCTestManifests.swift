import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BoolExtensionsTests.allTests),
        testCase(OMPLibraryTests.allTests),
        testCase(HttpClientTests.allTests),
    ]
}
#endif
