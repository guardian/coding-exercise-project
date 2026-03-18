import Testing
@testable import coding_exercise_gu

// Documentation on Swift Testing
// https://developer.apple.com/xcode/swift-testing/
// https://developer.apple.com/documentation/testing/definingtests


final class MainTests {
    @Test("function should return 10")
    func testExample() {
        let value = coding_exercise_gu.someNumber()
        #expect(value == 10, "The someNumber function should return 10")
    }
}