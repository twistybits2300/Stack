import Foundation

/// A simple value semantics implementation of a stack
/// that uses an array as its storage.
public struct Stack<T> {
    internal var storage: [T]

    /// Default initializer.
    public init() {
        self.storage = [T]()
    }
    
    /// Initializes using the provided `storage` array.
    /// - Parameter storage: The storage array to be used.
    public init(storage: [T]) {
        self.storage = storage
    }
}
