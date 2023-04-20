//
//  MTCollectionViewTableViewCell.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 20.04.2023.
//

import UIKit

class MTCollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "MTCollectionViewTableViewCell"
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 320)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "marvelTimeCollectionViewCell")
        collectionView.backgroundView = nil
        collectionView.backgroundColor = UIColor.clear
        
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    private func configureUI(){
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        contentView.addSubview(collectionView)
        contentView.backgroundColor = UIColor(named: "DarkGray")
    }
    
}

//MARK: - UICollectionViewDataSource

extension MTCollectionViewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marvelTimeCollectionViewCell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MTCollectionViewTableViewCell: UICollectionViewDelegate {
    
}
