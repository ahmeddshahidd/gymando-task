//
//  NetworkClient.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import Foundation
import UIKit

class NetworkClient: NetworkProvider {
    
    static let instance = NetworkClient()
    
    private init() {}
    
    func performOperation<T:Decodable>(request: URLRequest, response: T.Type,
                                       completionHandler:
                                       @escaping(T?, Error?)->Void) {

        URLSession.shared.dataTask(with: request) { serverData, serverResponse, serverError in

            // check for error
            guard serverError == nil else { return completionHandler(nil,httpError.serverError) }

            // check for success staus code
            guard let httpStausCode = (serverResponse as? HTTPURLResponse)?.statusCode,
                  (200...299).contains(httpStausCode) else {
                      return completionHandler(nil, httpError.nonSuccessStatusCode)
                  }

            // check if serverData is not empty
            guard serverData?.isEmpty == false else {
                return completionHandler(nil,httpError.noData)

            }

            // decode the result
            do {
                let result = try JSONDecoder().decode(response.self, from: serverData!)
                completionHandler(result,nil) // return success
            }catch {
                // return decode error
                completionHandler(nil,error)
            }
        }.resume()
    }
}
