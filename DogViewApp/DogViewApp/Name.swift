//
//  Name.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/19.
//

import Foundation

struct dogResponce: Codable {
    let message: [String: [String]]
}

struct DogImageResponse: Codable {
    let message: [String]
    let status: String
}

enum dogError: Error {
    case invalidError
    case decodeError
}
