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
        let font = vfjFile.font
        for glyph in font.glyphs {
            print (glyph)
        }
        
    }
    
    func testNodeInitFromString() throws {
        let strings = ["751 353 s",
                       "751 383  736 398  704 398 s g2 sx",
                       "672 398  657 383  657 353 s sy",
                       "657 321  672 308  705 308 s {n:'hr01'}",
                       "736 308  751 325 c"]
        for string in strings {
        print (try FontLabNode(from: string))
           
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
