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
    
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        return searchController
    }()
    
    private let searchContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let filterButton: UIButton  = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let comicsTable: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(MTComicTableViewCell.self, forCellReuseIdentifier: MTComicTableViewCell.identifier)
        table.backgroundView = nil
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "DarkGray")
        
        comicsTable.delegate = self
        comicsTable.dataSource = self
        navigationItem.searchController = searchController
        
        
        
        
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // comicsTable.frame = view.bounds.inset(by: UIEdgeInsets(top: 100, left: 12, bottom: 0, right: 12))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.searchBar.textField?.textColor = UIColor.white
        searchController.searchBar.changePlaceholderColor(.gray)
        searchController.searchBar.setLeftEmpty()
    }
    
    private func configureUI() {
        configureNavbar()
        configureSearchContainerView()
        
        configureSearchController()
       
        configureComicsTable()
       
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
    
    private func configureSearchContainerView() {
        view.addSubview(searchContainerView)
        NSLayoutConstraint.activate([
            searchContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchContainerView.heightAnchor.constraint(equalToConstant: 0)
        ])
    }
    
    private func configureSearchController() {
        searchContainerView.addSubview(searchController.searchBar)
        
        NSLayoutConstraint.activate([
            searchController.searchBar.topAnchor.constraint(equalTo: searchContainerView.topAnchor),
            searchController.searchBar.leadingAnchor.constraint(equalTo: searchContainerView.leadingAnchor),
            searchController.searchBar.trailingAnchor.constraint(equalTo: searchContainerView.trailingAnchor),
            searchController.searchBar.bottomAnchor.constraint(equalTo: searchContainerView.bottomAnchor)
        ])
    }
    
    private func configureFilterButton() {
        searchContainerView.addSubview(filterButton)
        
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: searchContainerView.topAnchor),
            filterButton.leadingAnchor.constraint(equalTo: searchContainerView.trailingAnchor),
            filterButton.trailingAnchor.constraint(equalTo: searchContainerView.trailingAnchor),
            filterButton.bottomAnchor.constraint(equalTo: searchContainerView.bottomAnchor)
        ])
    }
    
    private func configureComicsTable() {
        view.addSubview(comicsTable)
        comicsTable.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        NSLayoutConstraint.activate([
            comicsTable.topAnchor.constraint(equalTo: searchContainerView.bottomAnchor),
            comicsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            comicsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            comicsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
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
