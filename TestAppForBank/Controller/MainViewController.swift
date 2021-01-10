//
//  ViewController.swift
//  TestAppForBank
//
//  Created by Dima Biliy on 10.01.2021.
//

import UIKit

final class MainViewController: UIViewController , PresenterInput {
    
    private var mainView: MainView = MainView()
    
    public var outPut: PresenterOutput!
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outPut.getRequest()
    }
    
    public func showData(_ data: [ItemGit]) {
        mainView.updateStars(data)
    }
}

