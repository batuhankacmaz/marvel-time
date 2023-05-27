//
//  SteadyViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import UIKit

class ComicsViewController: UIViewController {
    
    var didSendEventClosure: ((ComicsViewController.Event) -> Void)?
    var stepperValue: UInt = 2 {
        didSet {
            heroCount.text = "\(stepperValue)"
        }
    }
    
    private let navigationBarTitle = MTNavigationBarTitle(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
    
    private let navigationBarAvatar = MTNavigationBarAvatar(frame: CGRect(x: 0, y: 0, width: 32, height: 32), avatarName: "wolverine", size: 32)
    
    private var modalView: MTModalView?
    
    private let heroLabel: UILabel = {
        let label = UILabel()
        label.text = "Hero Count"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let heroCount: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let heroLabelView = UIView()
    private let heroCountView = UIView()
    
    private let heroStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10.0
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchController.searchBar.showsBookmarkButton = true
        
        searchController.searchBar.setImage(UIImage(systemName: "gearshape.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .bookmark, state: .normal)
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
    
    private let plusButton: UIButton  = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor.white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor(named: "DarkGray")
       
        return button
    }()
    
    private let minusButton: UIButton  = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = UIColor(named: "DarkGray")
        return button
    }()
    
    private let closeButton: UIButton  = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        button.setTitle("Close", for: .normal)
        button.tintColor = UIColor(named: "DarkGray")
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
        searchController.searchBar.delegate = self
        
        configureUI()
      
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.searchBar.textField?.textColor = UIColor.white
        searchController.searchBar.changePlaceholderColor(.gray)
        searchController.searchBar.setLeftEmpty()
    }
    
    @objc private func didTapPlus() {
        if stepperValue < 6 {
            stepperValue += 1
        }
        
    }
    
    @objc private func didTapMinus() {
        if stepperValue > 1 {
            stepperValue -= 1
        }
    }
    
    @objc private func didTapClose() {
        modalView?.removeFromSuperview()
    }
    
    
    private func configureUI() {
        configureNavbar()
        configureSearchContainerView()
        configureSearchController()
        configureComicsTable()
        configureHeroStackView()
        configureHeroLabel()
        configureHeroCount()
        configureButtonStackView()
        configurePlusButton()
        configureMinusButton()
        configureCloseButton()
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
            searchController.searchBar.trailingAnchor.constraint(equalTo: searchContainerView.trailingAnchor, constant: -100),
            searchController.searchBar.bottomAnchor.constraint(equalTo: searchContainerView.bottomAnchor),
            
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
    
    private func configureHeroLabel() {
        heroLabel.centerSuperView(parentView: heroLabelView)
    }
    
    private func configureHeroCount() {
        heroCount.centerSuperView(parentView: heroCountView)
    }
    
    private func configurePlusButton() {
        plusButton.addTarget(self, action: #selector(didTapPlus), for: .touchUpInside)
    }
    
    private func configureHeroStackView() {
        heroStackView.addSubviews([heroLabelView, heroCountView])
    }
    
    private func configureButtonStackView() {
        buttonStackView.addSubviews([minusButton, plusButton])
    }
    
    private func configureMinusButton() {
        minusButton.addTarget(self, action: #selector(didTapMinus), for: .touchUpInside)
    }
    
    private func configureCloseButton() {
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
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

//MARK: - UISearchbarDelegate

extension ComicsViewController: UISearchBarDelegate {
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        modalView = MTModalView(frame: view.bounds)
        
        modalView?.addCustomSubview([heroStackView, buttonStackView, closeButton])
        view.addSubview(modalView!)
    }
    
    @objc private func stepperValueChanged(sender: UIStepper) {
        // stepperValue = sender.value
    }
}
