import SwiftUI
import Combine
import Foundation
//// 임시 : 구조체 다시 정의
struct Chatroom: Codable, Hashable {
    var chatRoomId: Int
    var userId: String
    var participantId: String
    var postId: Int?
}

// 채팅방 생성 어떤 데이터를 보내는가? 이름 ?
func postCreateChatroom(userId: String, postId: Int, participantId: String, completion: @escaping (Result<Chatroom, Error>) -> Void) {
    guard let url = URL(string: "http://172.19.20.95:8080/chat/room/create") else {
        completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let chatroom = Chatroom(chatRoomId: 0, userId: userId, participantId: participantId, postId: postId)
    do {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        request.httpBody = try encoder.encode(chatroom)
    } catch {
        completion(.failure(error))
        return
    }

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
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let createdChatroom = try decoder.decode(Chatroom.self, from: data)
            completion(.success(createdChatroom))
        } catch {
            completion(.failure(error))
        }
    }

    task.resume()
}

//
//채팅방 정보 받기 , 룸 아이디
import Foundation

func getChatrooms(userId: String, completion: @escaping (Result<[Chatroom], Error>) -> Void) {
    // URL을 생성
    guard let url = URL(string: "http://172.19.20.95:8080/chat/find_room?userId=\(userId)") else {
        completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
        return
    }

    // URL 요청 생성
    let request = URLRequest(url: url)

    // URLSession을 사용하여 데이터 작업 생성
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        // 오류가 발생한 경우 처리
        if let error = error {
            completion(.failure(error))
            return
        }

        // 데이터가 없는 경우 처리
        guard let data = data else {
            completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
            return
        }

        do {
            // JSON 데이터를 디코딩하여 Chatroom 배열로 변환
            let decoder = JSONDecoder()
            let chatrooms = try decoder.decode([Chatroom].self, from: data)
            // 성공 결과 반환
            completion(.success(chatrooms))
        } catch {
            // 디코딩 오류 처리
            completion(.failure(error))
        }
    }

    // 작업 시작
    task.resume()
}

func joinChatroom(roomId: Int, completion: @escaping (Result<Chatroom, Error>) -> Void) {
    // URL을 생성
    guard let url = URL(string: "http://172.19.20.95:8080/chat/join_room?roomId=\(roomId)") else {
        completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
        return
    }

    // URL 요청 생성
    let request = URLRequest(url: url)

    // URLSession을 사용하여 데이터 작업 생성
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        // 오류가 발생한 경우 처리
        if let error = error {
            completion(.failure(error))
            return
        }

        // 데이터가 없는 경우 처리
        guard let data = data else {
            completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
            return
        }

        do {
            // JSON 데이터를 디코딩하여 Chatroom 객체로 변환
            let decoder = JSONDecoder()
            let chatroom = try decoder.decode(Chatroom.self, from: data)
            // 성공 결과 반환
            completion(.success(chatroom))
        } catch {
            // 디코딩 오류 처리
            completion(.failure(error))
        }
    }

    // 작업 시작
    task.resume()
}
