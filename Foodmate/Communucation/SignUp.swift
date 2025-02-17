import Foundation

// Define the struct
struct SignUpUser: Codable {
    let id: String
    var passwd: String
    
    let name: String
    var nickname: String
    var birth: String
    var email: String
}

// Extension to convert struct to JSON
extension SignUpUser {
    func toJSON() throws -> Data {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try encoder.encode(self)
    }
}

// Example usage
let newUser = SignUpUser(id: "123456", passwd: "password123", name: "John Doe", nickname: "johndoe", birth: "1990-01-01", email: "john.doe@example.com")

func postSignUpUser(newUser: SignUpUser){
    do {
        let jsonData = try newUser.toJSON()
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            // Perform POST request with the JSON data
            // Replace the URL with your endpoint
            let url = URL(string: ServerAddress + "/signup")!
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
        }
    } catch {
        print("Error encoding JSON: \(error)")
    }
}
