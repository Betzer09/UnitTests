//
//  SignUpFormModelValidator.swift
//  PhotoAppWalkAlongTests
//
//  Created by Austin Betzer on 8/13/21.
//

import XCTest
@testable import PhotoAppWalkAlong

class SignUpFormModelValidatorTests: XCTestCase {
    
    var sut: SignUpFormModelValidator!

    override func setUp() {
        sut = SignUpFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    
    func testSignUpFromModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Austin")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned false")
    }
    
    func testSignUpFormMOdelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isFirstNameValidTwoCharacter = sut.isFirstNameValid(firstName: "Au")
        let isFirstNameValidOneCharacter = sut.isFirstNameValid(firstName: "A")
        
        // Assert
        XCTAssertFalse(isFirstNameValidOneCharacter, "The isFirstNameValid() should have returned False for a first name that is shorter than 2 characters but it has returned TRUE.")
        XCTAssertTrue(isFirstNameValidTwoCharacter, "The isFirstNameValid() should have returned TRUE for a first name that is longer than 1 character but it has returned False.")
    }
    
    func testSignUpFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isFirstNameValidTwoCharacter = sut.isFirstNameValid(firstName: "AustinAustin")
        
        // Assert
        XCTAssertFalse(isFirstNameValidTwoCharacter, "The isFirstNameValid() should have returned False for a first name that is longer than 10 character but it has returned True.")
    }
    
    func testSignUpFormModelValidator_WhenEmailWithAtSymboleIsNotPresent_ShouldReturnFalse() {
        // Arrange
        // Act
        let isValidEmail = sut.isValidEmail("austinstrides.dev")
        
        // Assert
        XCTAssertFalse(isValidEmail, "The isValidEmail() should have returned FALSE for an email without an \"@\" symbol but instead it TRUE")
    }
    
    func testSignUpFormModelValidator_WhenEmailWithAtDomainIsNotPresent_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isValidEmail = sut.isValidEmail("austin@stridesdev")
        
        // Assert
        XCTAssertFalse(isValidEmail, "The isValidEmail() should have returned FALSE for an email without an \".\" symbol but instead it TRUE")
    }
    
    func testSignUpFormModelValidator_WhenValidEmailIsProvided_ShouldReturnTrue() {
        // Arrange
        
        // Act
        let isValidEmail = sut.isValidEmail("austin@strides.dev")
        
        // Assert
        XCTAssertTrue(isValidEmail, "The isValidEmail() should have returned TRUE for an email that has been correctly formatted with an \"@\" and a period \".\" ")
    }
    
    func testSignUpFormModelValidator_WhenTooShortOfPasswordIsProvided_ShouldReturnFalse() {
        // Arrange
        
        // Act
        let isValidWithNullPassword = sut.isValidPassword(nil)
        let isValidWithSixCharacters = sut.isValidPassword("111111")
        let isValidWithMoreThenSixCharacters = sut.isValidPassword("11111111")
        let isValidWhenTooShortOfAPasswordIsPresent = sut.isValidPassword("1111")
        
        // Assert
        XCTAssertTrue(isValidWithSixCharacters, "The isValidPassword() should have returned TRUE when at least 6 characters are passed in but instead returned FALSE")
        XCTAssertTrue(isValidWithMoreThenSixCharacters, "The isValidPassword() should have returned TRUE when at least 6 characters are passed in but instead returned FALSE")
        XCTAssertFalse(isValidWithNullPassword, "The isValidPassword() should have returned FALSE when a password with a value of null is passed in but instead returned TRUE")
        XCTAssertFalse(isValidWhenTooShortOfAPasswordIsPresent, "The isValidPassword() should have returned FALSE when a password with less then 6 characters are passed in but instead returned TRUE")
    }
    
    func testSignUPFormModelValidator_WhenTwoPasswordsAreEntered() {
        let isMatchingPasswordValid = sut.doPasswordsMatch(pass: "1234", confirmationPassword: "1234")
        let isMissMatchingPasswordValid = sut.doPasswordsMatch(pass: "1234", confirmationPassword: "123456")
        
        XCTAssertTrue(isMatchingPasswordValid, "The doPasswordsMatch() should have returned TRUE since the passwords match. but it has returned FALSE.")
        
        XCTAssertFalse(isMissMatchingPasswordValid, "The doPasswordsMatch() should have returned FALSE since the passwords do not match, but it has returned TRUE.")
        
        
        
    }
    
    
    
}
