//
//  BiFunction.swift
//  Functional
//
//  Created by Geonu Jeon on 2021/05/24.
//

import Foundation

open class BiFunction<T, U, R> {
    public let apply: (T, U) -> R
    
    public init(_ apply: @escaping (T, U) -> R) {
        self.apply = apply
    }
    
    public func andThen<V>(_ after: Function<R, V>) -> BiFunction<T, U, V> {
        return .init { (t, u) in
            return after.apply(self.apply(t, u))
        }
    }
}
