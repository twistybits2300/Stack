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
}
