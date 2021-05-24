//
//  Function.swift
//  functional
//
//  Created by Geonu Jeon on 2021/05/24.
//

import Foundation

infix operator ∘ : MultiplicationPrecedence
public func ∘ <T, R, V>(lhs: Function<R, V>, rhs: Function<T, R>) -> Function<T, V> {
    return lhs.compose(rhs)
}

open class Function<T, R> {
    public let apply: (T) -> R
    
    public init(_ apply: @escaping (T) -> R) {
        self.apply = apply
    }
    
    public func andThen<V>(_ after: Function<R, V>) -> Function<T, V> {
        return .init { (t) in
            return after.apply(self.apply(t))
        }
    }
    
    public func compose<V>(_ before: Function<V, T>) -> Function<V, R> {
        return .init { (t) in
            return self.apply(before.apply(t))
        }
    }
    
    public static func identity<T>() -> Function<T, T> {
        return .init { (t) in
            return t
        }
    }
    
    @available(*, deprecated, message: "Use ∘.")
    public static func * <V>(lhs: Function<V, R>, rhs: Function<T,V>) -> Function<T, R> {
        return lhs.compose(rhs)
    }
}
