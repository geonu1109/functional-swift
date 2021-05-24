//
//  FunctionTests.swift
//  FunctionalTests
//
//  Created by Geonu Jeon on 2021/05/24.
//

import XCTest
@testable import Functional

class FunctionTests: XCTestCase {
    func testComposition() throws {
        let oper1: Function<Int, Int> = .init { $0 * 4 }
        let oper2: Function<Int, Int> = .init { $0 + 4 }
        let oper3: Function<Int, Int> = .init { $0 / 2 }
        
        let actual: Int = (oper1 ∘ oper2 ∘ oper3).apply(100)
        let expected: Int = ((100 / 2) + 4) * 4
        
        XCTAssertEqual(actual, expected)
    }
}
