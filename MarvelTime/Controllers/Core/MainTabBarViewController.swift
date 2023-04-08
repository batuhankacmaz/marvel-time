//
//  MainTabBarViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 8.04.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let favoritesVC = UINavigationController(rootViewController: FavoritesViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        favoritesVC.tabBarItem.image = UIImage(systemName: "star.fill")
        
        homeVC.title = "Home"
        favoritesVC.title = "Favorites"
        
        tabBar.tintColor = UIColor(named: "DarkYellow")
        tabBar.unselectedItemTintColor = .white
        
        setViewControllers([homeVC, favoritesVC], animated: true)
        
    }
    


}
