import XCTest

#if os(Linux)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BoolExtensionsTests.allTests),
        testCase(OMPLibraryTests.allTests),
        testCase(HttpClientTests.allTests),
        testCase(ParserTests.allTests),
    ]
}
#endif
