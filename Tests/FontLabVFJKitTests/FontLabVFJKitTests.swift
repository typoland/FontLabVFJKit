import XCTest
@testable import FontLabVFJKit

final class FontLabVFJKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FontLabVFJKit().text, "Hello, World!")
    }
    
    func testOpenFile() throws {
        let path = "/Users/lukasz/Downloads/jsonFiles/ClnNew/ClnNew-ThinUltCondLowLow.vfj"
        let url = URL(fileURLWithPath: path)
        let data = try Data.init(contentsOf: url)
        let decoder = JSONDecoder.init()
        let vfjFile = try decoder.decode(VFJFile.self, from: data)
        print (vfjFile)
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
