//
//  Fetch.swift
//  LogIn
//
//  Created by 倪卫国 on 2019/10/26.
//  Copyright © 2019 hubot. All rights reserved.
//

import Foundation

enum NetworkError : Error {
    case invalidResponse(String)
    case failed(Error)
    case apiError(APIError)
}

enum FetchError : Error {
    case invalidURL
    case invalidRequest
}

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

extension Result {
    init(value: Success?, error: Failure?) {
        if let error = error {
            self = .failure(error)
        } else if let value = value {
            self = .success(value)
        } else {
            fatalError("Could not create Result")
        }
    }
}

final class Fetch {
    
    private var method: HTTPMethod = .get
    private var body: Data?
    private var request: URLRequest?
    
    /// - Throws: FetchError.invalidURL
    private func createRequest(_ urlStr: String) throws {
        guard let url = URL(string: urlStr) else {
            throw FetchError.invalidURL
        }
        
        request = URLRequest(url: url)
    }
    
    /// - Throws: FetchError.invalidURL
    func get(_ url: String) throws -> Fetch {
        try createRequest(url)
        method = .get
        request?.httpMethod = HTTPMethod.get.rawValue
        return self
    }
    
    /// - Throws: FetchError.invalidURL
    func post(url: String) throws -> Fetch {
        try createRequest(url)
        method = .post
        request?.httpMethod = HTTPMethod.post.rawValue
        return self
    }
    
    func addHeader(key: String, value: String) -> Fetch {
        request?.addValue(value, forHTTPHeaderField: key)
        return self
    }
    
    /// Set the request body as JSON data.
    ///
    /// - Parameters:
    ///   - value: An encodable value.
    /// - Throws: Will rethrow the encoding error.
    func sendJSON<T: Encodable>(_ value: T) throws -> Fetch {
        request?.addValue("application/json", forHTTPHeaderField: "Content-Type")
        body =  try JSONEncoder().encode(value)
        return self
    }
    
    /// Start request.
    ///
    /// - Throws: FetchError.invalidRequest if HTTPRequest is nil.
    func response(completionHandler: @escaping (Result<APIResponse, NetworkError>) -> Void) throws {
        
        func handleResponse(data: Data?, response: URLResponse?, error: Error?) {
            if let error = error {
                
                completionHandler(
                    Result(
                        value: nil,
                        error: NetworkError.failed(error)
                    )
                )
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                
                completionHandler(
                    Result(
                        value: nil,
                        error: NetworkError.invalidResponse("Not an HTTP Response")
                    )
                )
                return
            }
            
            
            /// Status code 204 has no body
            if httpResponse.statusCode == 204 {
                completionHandler(
                    Result(
                        value: APIResponse(
                            statusCode: httpResponse.statusCode,
                            body: nil
                        ),
                        error: nil
                    )
                )
                return
            }
            
            if let data = data {
                
                // For HTTP status code below 400
                if (200...399).contains(httpResponse.statusCode) {
                    
                    completionHandler(
                        Result(
                            value: APIResponse(
                                statusCode: httpResponse.statusCode,
                                body: String(data: data, encoding: .utf8)
                            ),
                            error: nil
                        )
                    )
                    
                    return
                }
                
                /// For HTTP status code above 400
                do {
                    var errResp = try JSONDecoder().decode(APIError.self, from: data)
                    errResp.statusCode = httpResponse.statusCode
                    
                    completionHandler(
                        Result(
                            value: nil,
                            error: NetworkError.apiError(errResp)
                        )
                    )
                } catch {
                    completionHandler(
                        Result(
                            value: nil,
                            error: NetworkError.failed(error)
                        )
                    )
                }
                
                return
            }
            
            completionHandler(
                Result(
                    value: nil,
                    error: NetworkError.invalidResponse("No Response")
                )
            )
        }
        
        guard let request = request else {
            throw FetchError.invalidRequest
        }
        
        switch method {
        case .get:
            let task = URLSession
                .shared
                .dataTask(with: request, completionHandler: handleResponse)
            
            task.resume()
          
        case .post, .patch, .put, .delete:
            let task = URLSession
                .shared
                .uploadTask(with: request, from: body, completionHandler: handleResponse)
            
            task.resume()
            
        }
    }
}
