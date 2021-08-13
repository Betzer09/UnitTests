//
//  SignUpWebServiceTest.swift
//  PhotoAppWalkAlongTests
//
//  Created by Austin Betzer on 8/13/21.
//

import XCTest
@testable import PhotoAppWalkAlong
class SignUpWebServiceTest: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }

    func testSignUpWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        let sut = SignUpWebService()
        
        let signUpFormRequestModel = SignUpFormRequestModel(firstName: "Austin", lastName: "Betzer", email: "test@gmail.com", password: "123456")
        
        sut.signUp(withForm: signUpFormRequestModel) { (result) in
            // Assert
            
        }
    }

}
