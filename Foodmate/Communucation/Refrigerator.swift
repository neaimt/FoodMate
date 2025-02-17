//
//  Refrigerator.swift
//  Foodmate
//
//  Created by 박근경 on 2024/05/13.
//

import Foundation
public struct Refrigerator: Codable {
    var IngredientList: [String]
}

// 전체 재료가 담긴 리스트
var AllRefrigerator: Refrigerator = Refrigerator(IngredientList: ["대파", "아보카도", "양파"])

// 사용자 아이디는 필요없는가 ?
//POST
func postRefrigerator(user: [String]) {
    do {
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(user)
        
        // Replace the URL with your endpoint
        let url = URL(string: ServerAddress + "/refrigerator/put")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle response or error
            if let error = error {
                print("Error: \(error)")
            } else if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    print("Response data: \(responseString)")
                }
            }
        }
        
        task.resume()
    } catch {
        print("Error encoding JSON: \(error)")
    }
}


// GET
func getRefrigeratorData(completion: @escaping (Result<Refrigerator, Error>) -> Void) {
    let url = URL(string: ServerAddress + "/refrigerator/show")!
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
            completion(.failure(error))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let refrigerator = try decoder.decode(Refrigerator.self, from: data)
            completion(.success(refrigerator))
        } catch {
            completion(.failure(error))
        }
    }
    
    task.resume()
}

// Example usage
//getRefrigeratorData { result in
//    switch result {
//    case .success(let refrigerator):
//        print("Ingredients: \(refrigerator.ingredientList)")
//    case .failure(let error):
//        print("Error: \(error)")
//    }
//}
