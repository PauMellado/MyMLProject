//
//  ML_ChallengeTests.swift
//  ML ChallengeTests
//
//  Created by Paulina Mellado Mateos on 31/03/25.
//

import XCTest
@testable import ML_Challenge

final class ML_ChallengeTests: XCTestCase {
    
    var findTest: ItemInteractor?

    override func setUpWithError() throws {
        try super.setUpWithError()
        findTest = ItemInteractor()
    }

    override func tearDownWithError() throws {
        findTest = nil
        try super.tearDownWithError()
    }

    func testWordFind() throws {
        let strWord = "Cama"
        let result = findTest?.findItem(strWord: strWord)
        XCTAssertNotNil(result)
        
    }

}
