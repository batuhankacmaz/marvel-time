//
//  GoViewController.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 12.04.2023.
//

import UIKit



class HomeViewController: UIViewController {
    
    typealias Characters = [MTCharacter]
    
    var didSendEventClosure: ((HomeViewController.Event) -> Void)?
    private var viewModel: HomeViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    let sectionTitles: [String] = ["Your New Issues", "Previews", "Based on Your Preferences"]
    
    private var charactersList: [Characters?] = [nil,nil,nil] {
        didSet {
            DispatchQueue.main.async {
                self.homeComicsTable.reloadData()
            }
            
        }
    }
    
    private let navigationBarTitle = MTNavigationBarTitle(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
    private let navigationBarAvatar = MTNavigationBarAvatar(frame: CGRect(x: 0, y: 0, width: 32, height: 32), avatarName: "wolverine", size: 32)
    
    private let homeComicsTable: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(MTCollectionViewTableViewCell.self, forCellReuseIdentifier: MTCollectionViewTableViewCell.identifier)
        table.backgroundView = nil
        table.backgroundColor = UIColor.clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
        view.backgroundColor = UIColor(named: "DarkGray")
        
        homeComicsTable.delegate = self
        homeComicsTable.dataSource = self
        viewModel.HomeUIEvents(.fetchAll)
        
        configureUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // homeComicsTable.frame = view.bounds => frame get bigger same as view
        
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
        navigationBarTitle.configureLabel(title: "Hi Batu")
        let leftBarButtonItem = UIBarButtonItem(customView: navigationBarTitle)
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    }
    
    private func configureRightPartNavbar() {
        let rightBarButtonItem = UIBarButtonItem(customView: navigationBarAvatar)
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
    }
    
    private func configureHomeComicsTable() {
        view.addSubview(homeComicsTable)
        NSLayoutConstraint.activate([
            homeComicsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            homeComicsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeComicsTable.topAnchor.constraint(equalTo: view.topAnchor),
            homeComicsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
}


//MARK: - GoViewController Extension

extension HomeViewController {
    enum Event {
        case comics
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
            guard let characters = self.charactersList[indexPath.section] else { return cell }

            cell.configure(with: characters)

            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        let button = configureTableViewHeaderButton(with: header)
        // Check if the label already exists in the header
        if let existingLabel = header.viewWithTag(100) as? UILabel {
            existingLabel.text = sectionTitles[section].firstUppercased
        } else {
            // Create a new label and add it to the header
            let label = configureTableViewHeaderLabel(with: header)
            label.tag = 100
            header.addSubview(label)
        }
        header.addSubview(button)
        // Remove the button if it exists in the header
        if let existingButton = header.viewWithTag(200) as? UIButton {
            existingButton.removeFromSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionTitles[section]

    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        guard let header = view as? UITableViewHeaderFooterView else {return}
//       
//        let label = configureTableViewHeaderLabel(with: header)
//        header.textLabel?.isHidden = true
//        header.addSubview(label)
//      
//        
//    }
    
    private func configureTableViewHeaderLabel(with header: UITableViewHeaderFooterView) -> UILabel {
        let lbl = UILabel(frame: CGRect(x: 0,y: header.frame.height-30, width: header.frame.size.width ,height: 20))
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .white
        lbl.text = header.textLabel?.text?.firstUppercased
        return lbl
    }
    
    private func configureTableViewHeaderButton(with header: UITableViewHeaderFooterView) -> UIButton {
        let btn = UIButton(frame: CGRect(x: header.frame.width - 60,y: header.frame.height-35, width: 50,height: 25))
        btn.setTitle("more", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        btn.layer.cornerRadius = 12.0
        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        btn.tintColor = UIColor.white
        return btn
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let  defaultOffset = view.safeAreaInsets.top
        let  offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
        navigationController?.navigationBar.barTintColor = UIColor(named: "DarkGray")
    }
    
}

//MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: HomeViewModelDelegate {
    func handleVMOutput(_ event: HomeViewModelOutput) {
        switch event {
        case .yourNewIssues(let characters):
            self.charactersList[0] = characters
            //self.charactersList.insert(characters, at: 0)
        case .previews(let characters):
            self.charactersList[1] = characters
            // self.charactersList.insert(characters, at: 1)
        case .basedOnPreferences(let characters):
            self.charactersList[2] = characters
            // self.charactersList.insert(characters, at: 2)
        case .showErrorMessage:
            print("error")
        }
    }
    
}



