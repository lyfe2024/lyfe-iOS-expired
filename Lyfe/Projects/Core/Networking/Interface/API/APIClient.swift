//
//  APIClient.swift
//  NetworkingInterface
//
//  Created by 송형욱 on 2023/09/21.
//  Copyright © 2023 com.lyfe.lyfe. All rights reserved.
//

import Foundation

public final class APIClient: APIProtocol {
    
    var session: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60 // seconds that a task will wait for data to arrive
        configuration.timeoutIntervalForResource = 300 // seconds for whole resource request to complete ,.
        return URLSession(configuration: configuration)
    }
    
    public func asyncRequest<T: Decodable>(endpoint: EndPointProvider, responseModel: T.Type) async throws -> T {
        do {
            let (data, response) = try await session.data(for: endpoint.asURLRequest())
            return try self.manageResponse(data: data, response: response)
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError(
                errorCode: "ERROR-0",
                message: "Unknown API error \(error.localizedDescription)"
            )
        }
    }
    
    public func asyncUpload<T: Decodable>(endpoint: EndPointProvider, responseModel: T.Type) async throws -> T {
        guard let uploadData = endpoint.uploadData else {
            throw APIError(errorCode: "ERROR-0", message: "Invalid upload data")
        }
        do {
            let (data, response) = try await session.upload(for: endpoint.asURLRequest(), from: uploadData)
            return try self.manageResponse(data: data, response: response)
        } catch let error as APIError {
            throw error
        } catch {
            throw APIError(
                errorCode: "ERROR-0",
                message: "Unknown API error \(error.localizedDescription)"
            )
        }
    }
}

extension APIClient {
    // MARK: Private
    
    private func manageResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw APIError(
                errorCode: "ERROR-0",
                message: "Invalid HTTP response"
            )
        }
        switch response.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                print("‼️", error)
                throw APIError(
                    errorCode: "Decoding Data Error Code",
                    message: "Error decoding data"
                )
            }
        default:
            guard let decodedError = try? JSONDecoder().decode(APIError.self, from: data) else {
                throw APIError(
                    statusCode: response.statusCode,
                    errorCode: "ERROR-0",
                    message: "Unknown backend error"
                )
            }
            if response.statusCode == 403 && decodedError.errorCode == "expiredToken ErrorCode" {
                // TODO: 토큰 에러 관련
            }
            throw APIError(
                statusCode: response.statusCode,
                errorCode: decodedError.errorCode,
                message: decodedError.message
            )
        }
    }
}
