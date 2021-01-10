//
//  NetworkingManager.swift
//  TestAppForBank
//
//  Created by Dima Biliy on 10.01.2021.
//

import Foundation

enum APPError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

enum Result<T> {
    case success(T)
    case failure(APPError)
}

final class NetworkService{
    
    private var standartUrl = "https://api.github.com/search/repositories?q="
    
    public func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
        let urlFull = standartUrl + url
        guard let dataURL = URL(string: urlFull) else {return}
        let session = URLSession.shared
     
        let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(Result.failure(APPError.networkError(error!)))
                return
            }
            
            guard let data = data else {
                completion(Result.failure(APPError.dataNotFound))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
            }
        })
        task.resume()
    }
}


