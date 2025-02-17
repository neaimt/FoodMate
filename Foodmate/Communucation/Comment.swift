import Foundation

// 서버에 POST 요청을 보내는 함수
func postRecipe(recipe: Recipe, urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
    // URL 생성
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        return
    }
    
    // URLRequest 생성
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // JSON 인코더 사용하여 Recipe 인코딩
    let encoder = JSONEncoder()
    do {
        let jsonData = try encoder.encode(recipe)
        request.httpBody = jsonData
    } catch {
        completion(.failure(error))
        return
    }
    
    // URLSession을 사용하여 네트워크 요청
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
            return
        }
        
        completion(.success(data))
    }
    
    task.resume()
}

// 사용 예제
//let recipe = Recipe(userid: "user123", foodname: ["Pasta", "Salad"], prefer: "Vegetarian")
//let urlString = "https://example.com/api/recipes"
//
//postRecipe(recipe: recipe, urlString: urlString) { result in
//    switch result {
//    case .success(let data):
//        print("Success: \(data)")
//    case .failure(let error):
//        print("Error: \(error)")
//    }
//}
