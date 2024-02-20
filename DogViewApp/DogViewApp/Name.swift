//
//  Name.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/19.
//

import Foundation

struct dogResponce: Codable {
    var message: [String: [String]]
}

enum dogError: Error {
    case invalidError
    case decodeError
}
