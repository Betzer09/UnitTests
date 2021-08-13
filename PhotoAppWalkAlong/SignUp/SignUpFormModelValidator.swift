//
//  SignUpFormModelValidator.swift
//  PhotoAppWalkAlong
//
//  Created by Austin Betzer on 8/13/21.
//

import Foundation

class SignUpFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.isEmpty {
            returnValue = false
        }
        
        if firstName.count < SignUpConstants.firstNameMinLength || firstName.count > SignUpConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.isEmpty {
            returnValue = false
        }
        
        if lastName.count < SignUpConstants.firstNameMinLength || lastName.count > SignUpConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String?) -> Bool {
        var returnValue = true
        
        guard let password = password else {returnValue = false ;return returnValue}
        
        if password.count < SignUpConstants.passwordMinLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordsMatch(pass: String, confirmationPassword: String) -> Bool {
        return pass == confirmationPassword
    }

}
