import XCTest
@testable import Stack

typealias StringStack = Stack<String>

/// Validation of `Stack`.
final class StackTests: XCTestCase {
    private let fixture = StackFixture()

    /// Validates that `init()` creates an empty `storage` array.
    func test_init_empty_storage() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertTrue(sut.storage.isEmpty)
    }

    /// Validates that `init(storage:)` correctly captures the given array.
    func test_initStorage()  throws {
        let sut = fixture.makeExampleSUT()
        XCTAssertEqual(sut.storage, fixture.exampleArray)
    }

    /// Validates that `push(_ element:)` works as expected.
    func test_push() throws {
        let sut = fixture.makePushedLetterSUT()
        XCTAssertEqual(sut.storage, fixture.expectedPushedArray)
    }

    /// Validates that `pop()` returns `nil` when the stack is empty.
    func test_pop_empty() throws {
        var sut = fixture.makeEmptySUT()
        XCTAssertNil(sut.pop())
    }

    /// Validates that `pop()` returns the top item from the stack.
    func test_pop() throws {
        var sut = fixture.makePushedLetterSUT()
        XCTAssertEqual(sut.storage, fixture.expectedPushedArray)

        let poppedLetter = sut.pop()
        XCTAssertEqual(poppedLetter, StackFixture.pushedLetter)

        XCTAssertEqual(sut.storage, fixture.exampleArray)
    }

    /// Validates that `pop()` works correctly to pop all items off the stack.
    func test_pop_all() throws {
        var sut = fixture.makeExampleSUT()

        for _ in fixture.exampleArray.indices {
            _ = sut.pop()
        }

        XCTAssertTrue(sut.storage.isEmpty)
    }

    /// Validates that `peek()` returns `nil` when the stack is empty.
    func test_peek_empty() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertNil(sut.peek())
    }

    /// Validates that `peek()` correctly returns the top item currently in the stack.
    func test_peek() throws {
        let sut = fixture.makePushedLetterSUT()
        XCTAssertEqual(sut.storage, fixture.expectedPushedArray)

        XCTAssertEqual(sut.peek(), StackFixture.pushedLetter)
    }

    /// Validates that `isEmpty` returns `true` when the stack is empty.
    func test_isEmpty_true() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertTrue(sut.isEmpty)
    }

    /// Validates that `isEmpty` returns `false` when the stack is not empty.
    func test_isEmpty_false() throws {
        let sut = fixture.makeExampleSUT()
        XCTAssertFalse(sut.isEmpty)
    }

    /// Validates that `count` returns zero when the stack is empty.
    func test_count_empty() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertEqual(sut.count, 0)
    }

    /// Validates that `count` returns the expected value.
    func test_count() throws {
        let expectedCount = fixture.exampleArray.count
        let sut = fixture.makeExampleSUT()
        XCTAssertEqual(sut.count, expectedCount)
    }
}

struct StackFixture {
    static let pushedLetter = "Z"

    var exampleArray: [String] {
        ["I", "A", "M", "S", "T", "A", "C", "K"]
    }

    var expectedPushedArray: [String] {
        ["I", "A", "M", "S", "T", "A", "C", "K", Self.pushedLetter]
    }

    func makeEmptySUT() -> StringStack {
        Stack()
    }

    func makeExampleSUT() -> StringStack {
        return Stack(storage: exampleArray)
    }

    func makePushedLetterSUT() -> StringStack {
        var sut = makeExampleSUT()
        sut.push(Self.pushedLetter)
        return sut
    }
}
