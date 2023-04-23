//
//  MTComicCollectionViewCell.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 23.04.2023.
//

import UIKit

class MTComicCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MTComicCollectionViewCell"
    
    private let comicImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "spider-man-example")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let comicHeader: UITextView = {
        let text = UITextView()
        text.text = "Spider-man"
        text.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        text.backgroundColor = .clear
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let comicType: UITextView = {
        let text = UITextView()
        text.text = "Marvel"
        text.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        text.backgroundColor = .clear
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let comicHistory: UITextView = {
        let text = UITextView()
        text.text = "16/03/2022"
        text.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        text.backgroundColor = .clear
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
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
}
