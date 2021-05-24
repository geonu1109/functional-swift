//
//  Runnable.swift
//  Functional
//
//  Created by Geonu Jeon on 2021/05/24.
//

import Foundation

open class Runnable {
    public let run: () throws -> Void
    
    public init(_ run: @escaping () throws -> Void) {
        self.run = run
    }
}
