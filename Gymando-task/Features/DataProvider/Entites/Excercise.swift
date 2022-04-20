//
//  Excercise.swift
//  Gymando-task
//
//  Created by Ahmed Shahid on 20.04.22.
//

import Foundation

// MARK: - ExcercisePage
struct ExcercisePage: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let excercise: [Excercise]
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous
        case excercise = "results"
    }
}

// MARK: - Excercise
struct Excercise: Codable, Identifiable {
    let id: Int
    let name, uuid: String
    let images: [Image]?
    let variations: [Int]?

}

// MARK: - Image
struct Image: Codable {
    let id: Int
    let uuid: String
    let exerciseBase: Int
    let image: String
    let isMain: Bool
    let status, style: String

    enum CodingKeys: String, CodingKey {
        case id, uuid
        case exerciseBase = "exercise_base"
        case image
        case isMain = "is_main"
        case status, style
    }
}

