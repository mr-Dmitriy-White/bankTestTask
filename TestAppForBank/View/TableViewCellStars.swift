//
//  TableViewCellStars.swift
//  TestAppForBank
//
//  Created by Dima Biliy on 10.01.2021.
//

import UIKit

final class TableViewCellStars: UITableViewCell {

    static let identifier = "TableViewCellStars"
    
    private var labelStar : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var labelName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addOnView()
        setupConstraints()
    }
    
    private func addOnView(){
        addSubview(labelStar)
        addSubview(labelName)
    }
    
    private func setupConstraints(){
        labelStar.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20).isActive = true
        labelStar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        labelStar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        labelStar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        labelName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 120).isActive = true
        labelName.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        labelName.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        labelName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupLabelData(_ data: ItemGit){
        labelStar.text = "\(data.stargazers_count)"
        labelName.text = "\(data.name)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelStar.text = nil
        labelName.text = nil
    }
}
