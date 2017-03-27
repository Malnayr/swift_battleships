import XCTest
@testable import swift_battleships

class swift_battleshipsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(swift_battleships().text, "Hello, World!")
    }


    static var allTests : [(String, (swift_battleshipsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
