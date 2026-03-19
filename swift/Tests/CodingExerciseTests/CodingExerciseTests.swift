import Testing
@testable import CodingExercise

// Documentation on Swift Testing
// https://developer.apple.com/xcode/swift-testing/
// https://developer.apple.com/documentation/testing/definingtests


final class CodingExerciseTests {
    @Test("function should return 10")
    func testExample() {
        let value = CodingExercise.someNumber()
        #expect(value == 10, "The someNumber function should return 10")
    }
}