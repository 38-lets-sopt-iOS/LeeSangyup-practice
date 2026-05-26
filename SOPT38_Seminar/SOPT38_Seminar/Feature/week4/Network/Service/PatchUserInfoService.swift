//
//  PatchUserInfoService.swift
//  SOPT38_Seminar
//
//  Created by 이상엽 on 5/7/26.
//

import Foundation

final class PatchUserInfoService {
    static var shared = PatchUserInfoService()
    private var userId: Int = 0
    private init() {}
    
    private func makeRequestBody(name: String, email: String, age: Int) -> Data? {
        do {
            let data = EditUserInfoRequestDTO(name: name, email: email, age: age
            )
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    private func makeRequest(body: Data?, userId: Int) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let baseUrl = baseURL
        print(baseUrl)
        let path = "/api/v1/users/\(userId)"
        let url = baseURL + path
        print(url)
        guard let encodedURL = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodedURL)
        
        request.httpMethod = "PATCH"
        
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("Request body: \(str)")
        }
        
        return request
    }
    
    func patchUserInfo(name: String, email: String, age: Int, userId: Int) async throws -> EditUserInfoResponseDTO {
        guard let body = makeRequestBody(name: name, email: email, age: age) else { throw NetworkError.requestEncodingError }
        
        let request = try makeRequest(body: body, userId: userId)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(request)")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response \(response)")
        
        guard(200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(EditUserInfoResponseDTO.self, from: data)
            return decoded
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error{
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
