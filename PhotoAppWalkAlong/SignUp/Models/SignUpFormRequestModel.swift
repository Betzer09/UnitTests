//
//  SignUpFormRequestModel.swift
//  PhotoAppWalkAlong
//
//  Created by Austin Betzer on 8/13/21.
//

import Foundation

struct SignUpFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}


