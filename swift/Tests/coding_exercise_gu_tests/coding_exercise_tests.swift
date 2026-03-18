import XCTest
@testable import coding_exercise_gu // Allows access to internal members


final class MainTests: XCTestCase {
    func testExample() {
        let value = coding_exercise_gu.someNumber()
        XCTAssertEqual(value, 10, "Value should be 10")
    }
}