//import Foundation
//
// Define the struct conforming to Codable
struct LoginUser: Codable {
    let username: String
    let password: String
}

//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let enabled: Bool
//    let authorities: [Authority]
//    let username, password, name: String
//    let accountNonLocked, accountNonExpired, credentialsNonExpired: Bool
//}
//
//// MARK: - Authority
//struct Authority: Codable {
//    let authority: String
//}
//struct PostLogin: Codable {
//    let username: String
//    let password: String
//    
//    enum CodingKeys:String,CodingKey {
//        case username
//        case password
//    }
//}
//
//func postLogin(id: String, passwd: String) {
//    print("id: \(id) \npasswd: \(passwd)")
//    
//    let comment = PostLogin(username: id, password: passwd)
//    
//    guard let uploadData = try? JSONEncoder().encode(comment)
//    else { return }
//    
//    // url 객체 정의
//    guard let url = URL(string: ServerAddress + "/loginProcess") else{
//        print("실패")
//        return
//    }
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
//        if let e = error {
//            NSLog("An error has occured:\(e.localizedDescription)")
//            print("실패")
//            return
//        }
//        
//        print("comment post success")
//    }
//
//    task.resume()
//}


import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let enabled: Bool
    let authorities: [Authority]
    let username, password, name: String
    let accountNonLocked, accountNonExpired, credentialsNonExpired: Bool
}

// MARK: - Authority
struct Authority: Codable {
    let authority: String
}

func login(username: String, password: String, completion: @escaping (Result<Welcome, Error>) -> Void) {
    guard let url = URL(string: "http://172.19.15.253:8080/loginProcess") else {
        completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
        return
    }
    // 요청 설정
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // 요청 바디 설정
    let body = [
        "username": username,
        "password": password
    ]
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
    } catch {
        completion(.failure(error))
        return
    }
    // URLSession 데이터 태스크 생성
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        guard let data = data else {
            completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
            return
        }
        do {
            // JSON 데이터 디코딩
            let welcome = try JSONDecoder().decode(Welcome.self, from: data)
            completion(.success(welcome))
        } catch {
            completion(.failure(error))
        }
    }
    // 요청 실행
    task.resume()
}

// 사용 예제
//login(username: "your_username", password: "your_password") { result in
//    switch result {
//    case .success(let welcome):
//        print("로그인 성공: \(welcome)")
//    case .failure(let error):
//        print("로그인 실패: \(error)")
//    }
// }
