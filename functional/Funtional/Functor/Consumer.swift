//
//  Consumer.swift
//  Functional
//
//  Created by Geonu Jeon on 2021/05/24.
//

import Foundation

open class Consumer<T> {
    public let accept: (T) -> Void
    
    public init(_ accept: @escaping (T) -> Void) {
        self.accept = accept
    }
    
    public func andThen(_ after: Consumer<T>) -> Consumer<T> {
        return .init { (t) in
            self.accept(t)
            after.accept(t)
        }
    }
}
