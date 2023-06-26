//
//  File.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 11.04.2023.
//

import UIKit

class TabBarCoordinator: NSObject, Coordinator {
    var rootViewController: UIViewController?
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController
    
    var type: CoordinatorType { .tab }
    
    required  init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
        self.tabBarController = .init()
    }
    
    func start() {
        let pages: [TabBarPage] = [.home, .comics, .favorites]
            .sorted { $0.pageOrderNumber() < $1.pageOrderNumber() }
        
        let controllers: [UINavigationController] = pages.map { getTabBarController($0) }
        
        prepareTabBarController(withTabBarControllers: controllers)
        
    }
    
    deinit {
        print("TabBarCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabBarControllers tabBarControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabBarControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.home.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = UIColor(named: "DarkGray")
        tabBarController.tabBar.barTintColor = UIColor(named: "DarkGray")
        tabBarController.tabBar.tintColor = UIColor(named: "DarkYellow")
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabBarController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        
        navController.tabBarItem = UITabBarItem(title: page.pageTitleValue(), image: UIImage(systemName: page.tabIconValue()), tag: page.pageOrderNumber())
        
        switch page {
        case .home:
            let homeVC = HomeViewController()
            homeVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .comics:
                    self?.selectPage(.comics)
                }
            }
            
            navController.pushViewController(homeVC, animated: true)
        case .comics:
            let comicsVC = ComicsViewController()
            comicsVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .favorites:
                    self?.selectPage(.favorites)
                }
            }
            
            navController.pushViewController(comicsVC, animated: true)
        case .favorites:
            let favoritesVC = FavoritesViewController()
            favoritesVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .home:
                    self?.finish()
                }
            }
            
            navController.pushViewController(favoritesVC, animated: true)
        }
        
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage(index: tabBarController.selectedIndex) }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabBarCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        
    }
}



