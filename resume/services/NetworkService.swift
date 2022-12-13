//
//  NetworkService.swift
//  resume
//
//  Created by Michael Farrell on 12/12/22.
//

import Foundation

enum NetworkError: Error {
  case jsonParseError
  case badHttpResponseCode(code: Int)
  case unknown
}

///Extremely lightweight network service POC
class NetworkService {
  
  //On a larger system, this client data would be sourced elsewhere
  private func prepareRequest(url: URL) -> URLRequest {
    var req = URLRequest(url: url)

    req.setValue("mikes-resume-app", forHTTPHeaderField: "ios-client")
    req.setValue(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String, forHTTPHeaderField: "ios-client-version")
    
    //if this was an authenticated API, this is where token auth could be
    //request.addValue("JWT \(token)", forHTTPHeaderField: "Authorization")
    
    return req
  }
  
  //Nothing super fancy here
  func get<M>(url: URL) async -> (M?, Error?) where M: Decodable {
    let req = prepareRequest(url: url)
    
    do {
      let response = try await URLSession.shared.data(for: req)
      guard let httpResponse = (response.1 as? HTTPURLResponse) else { return (nil, NetworkError.unknown) }
      
      switch httpResponse.statusCode {
      case 200...299:
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try (decoder.decode(M.self, from: response.0), nil)
      default:
        return (nil, NetworkError.badHttpResponseCode(code: httpResponse.statusCode))
      }
    } catch {
      return (nil, error)
    }
  }
}
