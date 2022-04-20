//
//  NetworkProvider.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import Foundation
import Combine

enum httpError : Error {
    case jsonDecoding
    case noData
    case nonSuccessStatusCode
    case serverError
    case emptyCollection
    case emptyObject
}

protocol NetworkProvider {
    func performOperation<T: Decodable>(request: URLRequest, response: T.Type) -> Future<T, Error>
}
