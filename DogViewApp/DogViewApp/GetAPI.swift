//
//  GetAPI.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/19.
//

import Foundation

class Dog {
    
    func setDogList() async -> Result<dogResponce, dogError> {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            return .failure(.invalidError)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(dogResponce.self, from: data)
            return .success(response)
        } catch {
            return .failure(.decodeError)
        }
    }
}
//
//class DogImage {
//
//    func setDogImage() async -> Result<dogResponce, dogError> {
//        guard let apiUrl = URL(string: " https://dog.ceo/api/breed/\(selectedDogImage)/images") else {
//            return .failure(.invalidError)
//        }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: apiUrl)
//
//            let decoder = JSONDecoder()
//            let responce = try decoder.decode(dogResponce.self, from: data)
//            return .success(responce)
//        } catch {
//            return .failure(.decodeError)
//        }
//    }
//}
