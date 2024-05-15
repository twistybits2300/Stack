import Foundation

/// A simple value semantics implementation of a stack
/// that uses an array as its storage.
public struct Stack<T> {
    internal var storage: [T]

    // MARK: - Initialization
    /// Default initializer.
    public init() {
        self.storage = [T]()
    }
    
    /// Initializes using the provided `storage` array.
    /// - Parameter storage: The storage array to be used.
    public init(storage: [T]) {
        self.storage = storage
    }

    // MARK: - API
    /// Pushes the given `value` onto the top of the stack.
    /// - Parameter value: The value to be placed onto the top of the stack.
    public mutating func push(_ value: T) {
        storage.append(value)
    }
    
    /// Pops the current value on the top of the stack.
    /// - Returns: The current value on the top of the stack. May be `nil`.
    public mutating func pop() -> T? {
        storage.popLast()
    }

    /// Provides a way of looking at the top element of the stack without mutating
    /// its contents.
    /// - Returns: The item at the top of the stack. May be `nil` if the stack is empty.
    public func peek() -> T? {
        storage.last
    }

    /// Returns `true` if the stack is currently empty; `false` otherwise.
    public var isEmpty: Bool {
        storage.isEmpty
    }
    
    /// Returns the number of items currently on the stack.
    public var count: Int {
        storage.count
    }
}
