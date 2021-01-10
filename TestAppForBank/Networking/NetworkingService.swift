//
//  NetworkingService.swift
//  TestAppForBank
//
//  Created by Dima Biliy on 10.01.2021.
//

import Foundation

final class MyService{
    let networkService = NetworkService()
    
    func getStars(url: String, completion: @escaping ((GitModel) -> ())){
        networkService.dataRequest(with: url, objectType: GitModel.self) { (result: Result) in
            switch result {
            case .success(let object):
                completion(object)
            case .failure(let error):
                print(error)
            }
        }
    }
}
