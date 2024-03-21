////
////  LoginNetwork.swift
////  Foodmate
////
////  Created by 박근경 on 2024/02/25.
////
//
//import Foundation
//
//struct PostComment: Codable {
//    let id: String
//    let passwd: String
//    let name: String
//    
//    enum CodingKeys:String,CodingKey {
//        case id
//        case passwd
//        case name
//    }
//}
//
//func postComment(id: String, passwd: String, name: String) {
//    print("id: \(id) \npasswd: \(passwd)")
//    let comment = PostComment(id: id, passwd: passwd, name: name)
//    
//    guard (try? JSONEncoder().encode(comment)) != nil
//    else { return }
//    
//    // url 객체 정의
//    let url = URL(string: "http://172.20.10.4:8080/signupProcess")
//    var request = URLRequest(url: url!)
//    let formData: [String: Any] = ["id": id, "passwd": passwd, "name": name]
//    let formDataString = (formData.compactMap({ (key: String, value: Any) -> String in
//        return "\(key)=\(value)"
//    }) as Array).joined(separator: "&")
//    let formEncodeData = formDataString.data(using: .utf8)
//    
//    request.httpMethod = "POST"
//    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//    request.httpBody = formEncodeData
//    
//    let task = URLSession.shared.uploadTask(with: request, from: formEncodeData) { (data, response, error) in
//        if let e = error {
//            NSLog("An error has occured:\(e.localizedDescription)")
//            return
//        }
//        
//        print("comment post success")
//    }
//
//    task.resume()
//}
//
//
//struct PostLogin: Codable {
//    let id: String
//    let passwd: String
//    
//    enum CodingKeys:String,CodingKey {
//        case id
//        case passwd
//    }
//}
//
//let json: [String: Any] = ["id": "dydtlr", "passwd": "dydtlr"]
//
//func postLogin(id: String, passwd: String) {
//    print("id: \(id) \npasswd: \(passwd)")
//    
//    let comment = PostLogin(id: id, passwd: passwd)
//    
//    guard let uploadData = try? JSONEncoder().encode(comment)
//    else { return }
//    
//    let jsondata = try? JSONSerialization.data(withJSONObject: json)
//    
//    // url 객체 정의
//    let url = URL(string: "http://172.20.10.4:8080/loginProcess")
//    
//    var request = URLRequest(url: url!)
//    request.httpMethod = "POST"
////    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.httpBody = jsondata
//
//    let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
//        if let e = error {
//            NSLog("An error has occured:\(e.localizedDescription)")
//            return
//        }
//        
//        print("comment post success")
//    }
//
//    task.resume()
//}
