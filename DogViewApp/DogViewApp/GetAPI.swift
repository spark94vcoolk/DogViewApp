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



//    let urlString = "https://dog.ceo/api/breeds/list/all"
//    guard let requestUrl = URL(string: urlString) else{
//        return
//    }
//    let dataTask = URLSession.shared.dataTask(with: requestUrl){ (data,response,error) in
//
//        if let error = error {
//            print("Unexpected error:\(error.localizedDescription).")
//            return
//        }
//
//        if let response = response as? HTTPURLResponse {
//            if !(200...299).contains(response.statusCode) {
//                print("Request Failed - Status Code:\(response.statusCode).")
//                return
//            }
//        }
//
//        if let data = data {
//            do {
//                let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                if let dogInfos = jsonDict?["message"] as? [String: [String]] {
//                    print(dogInfos)
//                } else {
//                    print("jsonError :\(String(describing: jsonDict))")
//                }
//            } catch {
//                print("Error")
//            }
//        } else {
//            print("Unexpected error.")
//        }
//    }
//    dataTask.resume()
//}
//
//
