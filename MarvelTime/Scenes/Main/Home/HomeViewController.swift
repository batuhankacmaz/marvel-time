//
//  GoViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import UIKit



class HomeViewController: UIViewController {
    
    var didSendEventClosure: ((HomeViewController.Event) -> Void)?
    let sectionTitles: [String] = ["Your New Issues", "Previews", "Based on Your Preferences"]
    
    private let homeComicsTable: UITableView = {
       
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(MTCollectionViewTableViewCell.self, forCellReuseIdentifier: MTCollectionViewTableViewCell.identifier)
        table.backgroundView = nil
        table.backgroundColor = UIColor.clear
        table.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "DarkGray")
        
        homeComicsTable.delegate = self
        homeComicsTable.dataSource = self
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeComicsTable.frame = view.bounds
        
    }
    
    @objc private func didTapGoButton(_ sender: Any) {
        didSendEventClosure?(.comics)
    }
    
    private func configureUI() {
        configureHomeComicsTable()
        configureNavbar()
      
    }
    
    private func configureNavbar() {
        configureLeftPartNavbar()
        configureRightPartNavbar()
    }
    
    private func configureLeftPartNavbar() {
        let fontSize:CGFloat = 22;
        let font:UIFont = UIFont.boldSystemFont(ofSize: fontSize);
        let attributes = [NSAttributedString.Key.font: font];
        let item = UIBarButtonItem.init();
        
        item.title = "Hi Batu";
        item.tintColor = .white
        item.setTitleTextAttributes(attributes, for: UIControl.State.normal);
        
        self.navigationItem.leftBarButtonItem = item;
    }
    
    private func configureRightPartNavbar() {
        var image = UIImage(named: "wolverine")?.resizeImage(size: CGSize(width: 32, height: 32))
        
        image = image?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
    }
    
    private func configureHomeComicsTable() {
        view.addSubview(homeComicsTable)
    }
    
    
}


//MARK: - GoViewController Extension

extension HomeViewController {
    enum Event {
        case comics
    }
    
    enum Sections: Int {
        case YourNewIssues = 0
        case Previews = 1
        case BasedOnYourPreferences = 2
    }
}

//MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MTCollectionViewTableViewCell.identifier, for: indexPath) as? MTCollectionViewTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

//MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
}




