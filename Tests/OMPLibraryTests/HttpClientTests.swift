@testable import OMPLibrary

import Foundation
import FoundationNetworking
import XCTest

class HttpClientTests: XCTestCase {

    func baseTest(){
        let received = expectation(description: "Http Base Test")

        guard let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson") else{
            XCTFail("Cannot encode URL")
            received.fulfill()
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = Method.Get.rawValue

        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if let hasError = error{
                XCTFail("Error \(hasError.localizedDescription)")
                received.fulfill()
            }
            if let hasResponse = response as? HTTPURLResponse{
                if hasResponse.statusCode != 200{
                    XCTFail("Status Code: \(hasResponse.statusCode)")
                    received.fulfill()
                }else{
                    if let hasData = data, let result = String(data: hasData, encoding: .utf8){
                        XCTAssertNotNil(result, "Empty Result?!?")
                        print("Result:\n\(result)")
                        received.fulfill()
                    }

                }
            }
        })

        task.resume()

        wait(for: [received], timeout: 60.0)
    }

    func testGet(){
        let received = expectation(description: "Http Get Test")

        HttpClient.sharedInstance.request(
            async: true,
            urlString: "https://itunes.apple.com/search?term=jack+johnson",
            method: Method.Get,
            header: nil,
            bodyContent: nil,
            queue: DispatchQueue.global(qos: .utility))
            { result in
                switch result{
                    case .success(let data):
                    if let result = String(data: data, encoding: String.Encoding.utf8){
                        print("Received:\(result)")
                    }
                    XCTAssertNotNil(data)
                    received.fulfill()
                    case .failure(let error):
                    XCTFail(error.localizedDescription)
                    received.fulfill()
                }
            }

        wait(for: [received], timeout: 60.0)
    }

    static var allTests = [
        ("baseTest",baseTest),
        ("testGet",testGet),
    ]
}