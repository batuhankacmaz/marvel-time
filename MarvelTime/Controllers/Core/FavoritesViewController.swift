//
//  FavoritesViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 8.04.2023.
//

import UIKit

class FavoritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "DarkGray")
        view.addSubview(favoriteTitle)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        favoriteTitle.center = view.center
    }
    
    let  favoriteTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.text = "Favorites"
        label.textColor = .white
        label.font = label.font.withSize(30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    

}
