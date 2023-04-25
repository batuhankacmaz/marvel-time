//
//  SteadyViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import UIKit

class ComicsViewController: UIViewController {
    
    var didSendEventClosure: ((ComicsViewController.Event) -> Void)?
    
    private let navigationBarTitle = MTNavigationBarTitle(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
    
    private let navigationBarAvatar = MTNavigationBarAvatar(frame: CGRect(x: 0, y: 0, width: 32, height: 32), avatarName: "wolverine", size: 32)
    
    private let comicsTable: UITableView = {
       
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(MTComicTableViewCell.self, forCellReuseIdentifier: MTComicTableViewCell.identifier)
        table.backgroundView = nil
        table.backgroundColor = .clear
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkGray")
        
        comicsTable.delegate = self
        comicsTable.dataSource = self
        
        view.addSubview(comicsTable)
        
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        comicsTable.frame = view.bounds.inset(by: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
    }
    
    private func configureUI() {
        configureNavbar()
    }
    
    private func configureNavbar() {
        configureLeftPartNavbar()
        configureRightPartNavbar()
    }
    
    private func configureLeftPartNavbar() {
        navigationBarTitle.configureLabel(title: "Comics")
        let leftBarButtonItem = UIBarButtonItem(customView: navigationBarTitle)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func configureRightPartNavbar() {
        let rightBarButtonItem = UIBarButtonItem(customView: navigationBarAvatar)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    

}


//MARK: - ComicsViewController Extension

extension ComicsViewController {
    enum Event {
        case favorites
    }
}

//MARK: - UITableViewDataSource

extension ComicsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MTComicTableViewCell.identifier, for: indexPath)
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(named: "DarkGray")
        cell.backgroundColor = UIColor(named: "DarkGray")
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    
    
}

//MARK: - UITableViewDelegate

extension ComicsViewController: UITableViewDelegate {
    
}
