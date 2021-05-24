//
//  Supplier.swift
//  Functional
//
//  Created by Geonu Jeon on 2021/05/24.
//

import Foundation

open class Supplier<T> {
    public let get: () -> T
    
    public init(_ get: @escaping () -> T) {
        self.get = get
    }
}
