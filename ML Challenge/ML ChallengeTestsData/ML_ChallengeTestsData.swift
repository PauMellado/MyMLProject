//
//  ML_ChallengeTestsData.swift
//  ML ChallengeTestsData
//
//  Created by Paulina Mellado Mateos on 01/04/25.
//

import XCTest
@testable import ML_Challenge

final class ML_ChallengeTestsData: XCTestCase {
    
    var findTest: ItemRemoteDataManager?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        findTest = ItemRemoteDataManager()
    }
    
    override func tearDownWithError() throws {
        findTest = nil
        try super.tearDownWithError()
    }
    
    func testItemData() throws {
        let strWord = "Cama"
        let result = findTest?.getItems(strFind: strWord, completion: { result in
            XCTAssertNotNil(result)
        })
        XCTAssertNotNil(result)
    }
    
}
