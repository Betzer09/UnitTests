//
//  SignUpConstants.swift
//  PhotoAppWalkAlong
//
//  Created by Austin Betzer on 8/13/21.
//

import Foundation

typealias SignUpResponseCompletion = (Result<SignUpResponseModel, SignUpError>) -> ()

struct SignUpConstants {
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 10
    static let passwordMinLength = 8
    
    static let signUpURL = "http://appsdeveloperblog.com:8080/signup-mock-service/users"
}
