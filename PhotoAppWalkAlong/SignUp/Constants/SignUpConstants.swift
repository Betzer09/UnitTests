//
//  SignUpConstants.swift
//  PhotoAppWalkAlong
//
//  Created by Austin Betzer on 8/13/21.
//

import Foundation

typealias SignUpResult = (Result<SignUpResponseModel, SignUpError>) -> ()

struct SignUpConstants {
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 10
    static let passwordMinLength = 6
}
