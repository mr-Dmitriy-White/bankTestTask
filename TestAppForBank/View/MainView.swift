//
//  MainView.swift
//  TestAppForBank
//
//  Created by Dima Biliy on 10.01.2021.
//

import UIKit

final class MainView: UIView {
    
    private var starsArray = [ItemGit]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        addSubview(tableView)
        
        backgroundColor = .white
        
        tableView.register(TableViewCellStars.self, forCellReuseIdentifier: TableViewCellStars.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func updateStars(_ starsArray : [ItemGit]){
        self.starsArray = starsArray
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return starsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellStars.identifier, for: indexPath as IndexPath) as! TableViewCellStars
        cell.setupLabelData(starsArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        animationSlide(cell: cell, indexPath: indexPath)
        //or for example we can use animation which places on a line down. i've created this animation only for demonstration fabric pattern. mvp and assembler are good but it would be better to show something else especially if you don't need uiDesign. 
        //animationAlpha(cell: cell, indexPath: indexPath)
    }
    
    private func animationAlpha(cell: UITableViewCell, indexPath: IndexPath){
        let animation = AnimationFactory.makeFadeAnimation(duration: 0.5, delay: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    
    private func animationSlide(cell: UITableViewCell, indexPath: IndexPath){
        let animation = AnimationFactory.makeSlideIn(duration: 0.5, delay: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
}

