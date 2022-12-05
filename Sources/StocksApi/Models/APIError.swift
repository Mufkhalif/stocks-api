//
//  APIError.swift
//  
//
//  Created by mufkhalif on 05/12/22.
//

import Foundation


public struct ErrorResponse: Decodable {
    let code: String
    let description: String
    
    public init(code: String, description: String) {
        self.code = code
        self.description = description
    }
}



public enum APIServiceError: CustomNSError {
case invalidUrl
case invalidResponseType
case httpStatusCodeFailed(statusCode: Int, error: ErrorResponse?)
    
    static public var errorDomain: String { "XCAStockAPI" }
    
    public var errorCode: Int {
        switch self {
        case .invalidUrl: return 1
        case .invalidResponseType: return 2
        case .httpStatusCodeFailed: return 3
        }
    }
    
    public var errorUserInfo: [String : Any] {
        let text: String
        switch self {
            
        case .invalidUrl:
            text = "Invalid URL"
        case .invalidResponseType:
            text = "Invalid Response Type"
        case .httpStatusCodeFailed(statusCode: let statusCode, error: let error):
            if let error = error {
                text = "Error: Status Code\(error.code), message: \(error.description)"
            } else {
                text = "Error: Status Code \(statusCode)"
            }
        }
        
        return [NSLocalizedDescriptionKey: text]
    }
    
}
