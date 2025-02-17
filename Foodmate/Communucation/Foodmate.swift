//
//  Foodmate.swift
//  Foodmate
//
//  Created by 박근경 on 2024/05/16.
//

import Foundation

//POST 작성된 게시글 전송
import Foundation

func postFoodmate(user: Foodmate, completion: @escaping (Result<Data, Error>) -> Void) {
    do {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601Full)
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let jsonData = try encoder.encode(user)
        
        guard let url = URL(string: "http://172.19.20.95:8080/api/posts") else {
            print("오류")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
                if let data = data {
                    completion(.success(data))
                } else {
                    completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                }
            }
        }
        
        task.resume()
    } catch {
        completion(.failure(error))
    }
}

// GET 게시글 리스트를 받아온다
import Foundation

func getFoodmates(completion: @escaping (Result<[Foodmate], Error>) -> Void) {
    guard let url = URL(string: "http://172.19.20.95:8080/api/posts") else {
        completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
        return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
            return
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let foodmates = try decoder.decode([Foodmate].self, from: data)
            completion(.success(foodmates))
        } catch {
            completion(.failure(error))
        }
    }

    task.resume()
}

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
}
