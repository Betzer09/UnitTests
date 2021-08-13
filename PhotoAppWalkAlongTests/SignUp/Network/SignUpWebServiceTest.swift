//
//  SignUpWebServiceTest.swift
//  PhotoAppWalkAlongTests
//
//  Created by Austin Betzer on 8/13/21.
//

import XCTest
@testable import PhotoAppWalkAlong

class SignUpWebServiceTest: XCTestCase {
    var sut: SignUpWebService!
    var signUpFormRequestModel: SignUpFormRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignUpWebService(urlString: SignUpConstants.signUpURL, urlSession: urlSession)
        signUpFormRequestModel = SignUpFormRequestModel(firstName: "Austin", lastName: "Betzer", email: "test@gmail.com", password: "12345678")
    }
    
    override func tearDown() {
        sut = nil
        signUpFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testSignUpWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        
        let jsonString = "{\"status\": \"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let signUpFormRequestModel = SignUpFormRequestModel(firstName: "Austin", lastName: "Betzer", email: "test@gmail.com", password: "12345678")
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        sut.signUp(withForm: signUpFormRequestModel) { (result) in
            // Assert
            switch result {
            case .success(let res):
                XCTAssertEqual(res.status, "ok")
                expectation.fulfill()
            case .failure(_):
                return
            }
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignUpWebService_WhenGivenDifferentJSONResponse_ReturnsFailure() {
        
        let jsonString = "{\"path\": \"users\", \"error\": Internal Server Error}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different structure. ")
        
        sut.signUp(withForm: signUpFormRequestModel) { (result) in
            // Assert
            
            
            
            switch result {
            case .success: return
            case .failure(let error):
                XCTAssertEqual(error, SignUpError.responseModelParsingError, "The signup() method did not return expected error.")
                expectation.fulfill()
            }
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

}
