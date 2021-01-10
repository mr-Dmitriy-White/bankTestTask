//
//  MainViewPresenter.swift
//  TestAppForBank
//
//  Created by Dima Biliy on 10.01.2021.
//


import UIKit

enum RequestLink : String {
    case swiftPage1 = "language:Swift&page=1&per_page=15"
    case swiftPage2 = "language:Swift&page=2&per_page=15"
}

final class MainPresenter: PresenterOutput {
    
    public var netwokService: MyService!
    
    public var view: PresenterInput!
    
    private var array = [GitModel]()
    private var arraySorted = [ItemGit]()
    
    func getRequest() {
        getData()
    }
    
    private func getData() {
        netwokService = MyService()
        
        DispatchQueue.global().async {
            let dispatchGroup = DispatchGroup()
        
            dispatchGroup.enter()
            self.netwokService.getStars(url: RequestLink.swiftPage1.rawValue) { (result) in
                self.array.append(result)
                print(dispatchGroup)
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            self.netwokService.getStars(url: RequestLink.swiftPage2.rawValue) { (result) in
                self.array.append(result)
                print(dispatchGroup)
                dispatchGroup.leave()
            }
            dispatchGroup.wait()
            
            DispatchQueue.main.async {
                for gitModel in self.array{
                    for itemGit in gitModel.items{
                        self.arraySorted.append(itemGit)
                    }
                }
                self.arraySorted.sort { $0.stargazers_count > $1.stargazers_count  }
                self.view.showData(self.arraySorted)
            }
        }
    }
}
