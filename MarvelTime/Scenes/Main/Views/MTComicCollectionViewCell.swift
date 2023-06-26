//
//  MTComicCollectionViewCell.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 23.04.2023.
//

import UIKit
import SDWebImage

class MTComicCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MTComicCollectionViewCell"
    
    private let comicImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "spider-man-example")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let comicHeader: UILabel = {
        let label = UILabel()
        label.text = "Spider-man"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.backgroundColor = .clear
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let comicType: UILabel = {
        let label = UILabel()
        label.text = "Marvel"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.backgroundColor = .clear
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let comicHistory: UILabel = {
        let label = UILabel()
        label.text = "16/03/2022"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.backgroundColor = .clear
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "Gray")
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureUI() {
        configureComicImageView()
        configureComicHeader()
        configureComicType()
        configureComicHistory()
    }
    
    private func configureComicImageView() {
        contentView.addSubview(comicImageView)
        
        NSLayoutConstraint.activate([
            comicImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            comicImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            comicImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            comicImageView.heightAnchor.constraint(equalToConstant: contentView.frame.height - 80),
        ])
    }
    
    private func configureComicHeader() {
        contentView.addSubview(comicHeader)
        
        NSLayoutConstraint.activate([
            comicHeader.topAnchor.constraint(equalTo: comicImageView.bottomAnchor, constant: 0),
            comicHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            comicHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            comicHeader.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    
    private func configureComicType() {
        contentView.addSubview(comicType)
        
        NSLayoutConstraint.activate([
            comicType.topAnchor.constraint(equalTo: comicHeader.bottomAnchor, constant: -6),
            comicType.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            comicType.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            comicType.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    
    private func configureComicHistory() {
        contentView.addSubview(comicHistory)
        
        NSLayoutConstraint.activate([
            comicHistory.topAnchor.constraint(equalTo: comicType.bottomAnchor, constant: -10),
            comicHistory.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            comicHistory.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            comicHistory.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    
    public func configure(with model: MTCharacterViewModel) {
        guard let path = model.thumbnail?.path, let imageExtension = model.thumbnail?.extensionValue, let name = model.name else  { return }
        let completePath = "\(path).\(imageExtension)"
        guard let url = URL(string: completePath) else { return }
        comicImageView.sd_setImage(with: url)
        comicHeader.text = name
        comicHistory.text = model.modifiedDate
        
    }
}
