//
//  SignUpWebService.swift
//  PhotoAppWalkAlong
//
//  Created by Austin Betzer on 8/13/21.
//

import Foundation


class SignUpWebService {
    
    private var urlString: String
    private var urlSession: URLSession
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signUp(withForm formModel: SignUpFormRequestModel,
                completion: @escaping SignUpResponseCompletion) {
        
        guard let url = URL(string: urlString) else {
            // TODO: : Create a unit test
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        urlSession.dataTask(with: request) { (data, response, error) in
            // TODO: Write a new unit test to handle and error here
            
            if let _ = error {
                return
            }
            
            if let data = data,
               let res = try? JSONDecoder().decode(SignUpResponseModel.self, from: data) {
                
                completion(.success(res))
            } else {
                completion(.failure(.responseModelParsingError))
            }
            
        }.resume()
    
    }
}
