//
//  SwiftUIPracticeTests.swift
//  SwiftUIPracticeTests
//
//  Created by Tunahan Aydınoglu on 22.04.2023.
//

import XCTest
@testable import SwiftUIPractice

final class SwiftUIPracticeTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Any test you write for XCTest can be annotated as throws and async.
    // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  func testFetchUser() async {
    let manager = NetworkManager.networkManager
    let path = ApiNetworkPath.users
    
    do {
      let usersResponse = await manager.fetch(path: path, method: .get, type: UsersResponse.self)
      XCTAssertEqual(usersResponse?.data?.isEmpty, Optional(false))
    } catch {
      XCTFail("The service has error. Path: \(path.rawValue)")
    }
  }
  
}
