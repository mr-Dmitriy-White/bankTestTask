//
//  TableCellAnimationExtension.swift
//  TestAppForBank
//
//  Created by Dima Biliy on 10.01.2021.
//

import UIKit

typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void

final class Animator{
    private var hasAnimatedAllCells = false
    private let animation : Animation
    
    init(animation: @escaping Animation) {
        self.animation = animation
    }
    
    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView){
        guard !hasAnimatedAllCells else {return}
        animation(cell,indexPath,tableView)
        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
    }
}

enum AnimationFactory{
    static func makeFadeAnimation(duration: TimeInterval, delay : Double) -> Animation{
        return { cell , indexPath , _ in
            cell.alpha = 0
            UIView.animate(withDuration: duration, delay: delay*Double(indexPath.row)) {
                cell.alpha = 1
            }
        }
    }
    
    static func makeSlideIn(duration: TimeInterval, delay: Double) -> Animation{
        return { cell , indexPath , tableView in
            cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
            UIView.animate(withDuration: duration, delay: delay*Double(indexPath.row), options: [.curveEaseInOut]) {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        }
    }
}

// расширение для анимации ячеек тэйбл вью чтобы знать последнюю видимую ячейку
extension UITableView{
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool{
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {return false}
        return lastIndexPath == indexPath
    }
}
