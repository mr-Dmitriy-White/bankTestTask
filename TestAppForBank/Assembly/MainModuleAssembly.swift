//
//  MainModuleAssembly.swift
//  TestAppForBank
//
//  Created by Dima Biliy on 10.01.2021.
//

import UIKit


final class MainModuleAssembly{
    class func configuredModule() -> UIViewController{
        let view = MainViewController()
        let presenter = MainPresenter()
        let networkingManager = MyService()
        view.outPut = presenter
        presenter.view = view
        presenter.netwokService = networkingManager
        return view
    }
}
