//
//  ExcerciseRouter.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import Foundation

enum ExcerciseRouter {
    case excercises
    case excercise(id: Int)
    
    private var endpoint: String {
        "https://wger.de/api/v2"
    }
    
    var urlString: String {
        "\(endpoint)/\(path)"
    }
    
    var path: String {
        switch self {
        case .excercises:
            return "exerciseinfo/"
        case .excercise(let id):
            return "exerciseinfo/\(id)"
        }
    }
    
    func asURLRequest() -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = "get"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        // Set other property,  parameters for requestInfo here
        
        return urlRequest
    }
}
