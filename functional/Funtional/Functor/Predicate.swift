//
//  Predicate.swift
//  Functional
//
//  Created by Geonu Jeon on 2021/05/24.
//

import Foundation

open class Predicate<T> {
    public let test: (T) -> Bool
    
    public init(_ test: @escaping (T) -> Bool) {
        self.test = test
    }
    
    public func and(_ other: Predicate<T>) -> Predicate<T> {
        return .init { (t) in
            return self.test(t) && other.test(t)
        }
    }
    
    public func negate() -> Predicate<T> {
        return .init { (t) in
            return !self.test(t)
        }
    }
    
    public func or(_ other: Predicate<T>) -> Predicate<T> {
        return .init { (t) in
            return self.test(t) || other.test(t)
        }
    }
    
    public static func not(_ target: Predicate<T>) -> Predicate<T> {
        return .init { (t) in
            return !target.test(t)
        }
    }
}

extension Predicate where T: Equatable {
    public static func isEqual(_ targetRef: T) -> Predicate<T> {
        return .init { (t) in
            return t == targetRef
        }
    }
}
