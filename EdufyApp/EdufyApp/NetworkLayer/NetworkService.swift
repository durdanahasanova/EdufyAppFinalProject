
import Foundation

protocol NetworkService {
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void)
    
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}


final class DefaultNetworkService: NetworkService {

    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = endpoint.makeRequest()
        
        switch request {
        case .success(let urlRequest):
            
            do {
               let (data, response) = try await session.data(for: urlRequest)
                
                
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    
                    //401 refresh token
                    if statusCode == 401 {
                        guard let refreshToken = TokenManager.shared.refreshToken else {
                            throw NetworkError.serverError(statusCode: 401)
                        }
                        
                        let refreshRequest = AuthEndpoint.refresh(refreshToken).makeRequest()
                        guard case .success(let refreshURLRequest) = refreshRequest else {
                            throw NetworkError.serverError(statusCode: 401)
                        }
                        
                        let (refreshData, _) = try await session.data(for: refreshURLRequest)
                        let refreshResponse = try JSONDecoder().decode(APIResponse<LoginData>.self, from: refreshData)
                        
                        
                        guard refreshResponse.success, let loginData = refreshResponse.data else {
                            //fail token-logout
                            TokenManager.shared.clearTokens()
                            throw NetworkError.serverError(statusCode: 401)
                        }
                        
                        TokenManager.shared.saveTokens(
                            access: loginData.accessToken,
                            refresh: loginData.refreshToken
                        )
                        print("LOG: Token yenilendi")
                        return try await self.request(endpoint)
                    }
                    guard (200...299).contains(statusCode) else {
                        throw NetworkError.serverError(statusCode: statusCode)
                    }
                }
                
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw error //NetworkError.decodingError
                }
                
            } catch {
                throw error
            }
            
        case .failure(let error):
            throw error
        }
    }
    
    
    
    func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let createRequest = endpoint.makeRequest()
        
        switch createRequest {
        case .success(let request):
            session.dataTask(with: request) { data, response, error in
                
                if let error {
                    completion(.failure(.unknown(error)))
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    let statusCode = httpResponse.statusCode
                    
                    
                    
                    guard (200...299).contains(statusCode) else {
                        return completion(.failure(.serverError(statusCode: statusCode)))
                    }
                }
                
                guard let data else { return completion(.failure(.noData)) }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingError))
                }
            }.resume()
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
