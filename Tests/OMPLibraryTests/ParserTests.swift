@testable import OMPLibrary
import XCTest

class ParserTests: XCTestCase {

    func testParse(){
        let received = expectation(description: "JSON Data Received")

        HttpClient.sharedInstance.request(
            urlString: "https://itunes.apple.com/search?term=jack+johnson",
            method: .Get){
            result in
            switch result{
                case .success(let data):
                guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? JSON else{
                    XCTFail("Could not deserialize data...")
                    received.fulfill()
                    return
                }
                guard let jsonObject = Parser.jsonFrom(data: data) else {
                    XCTFail("Could not parse data...")
                    received.fulfill()
                    return
                }
                print("JSON Received:\n\(jsonObject)")
                received.fulfill()
                case .failure(let error):
                if let httpErr = error as? HttpClientError{
                    XCTFail(httpErr.localizedDescription)
                } else {
                    XCTFail(error.localizedDescription)
                }
                received.fulfill()
            }
        }

        wait(for: [received], timeout: 60)
    }

    static var allTests = [
        ("testParse",testParse),
    ]
}