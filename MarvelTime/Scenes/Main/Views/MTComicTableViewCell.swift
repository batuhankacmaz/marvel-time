//
//  MTComicTableViewCell.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 24.04.2023.
//

import UIKit

class MTComicTableViewCell: UITableViewCell {
    
    static let identifier = "MTComicTableViewCell"
    
    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "spider-man-example")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let comicLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Spider-man"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textColor = .white
        label.text = "Marvel Comics"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let modifiedLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textColor = .white
        label.text = "Next: 16/04/2022"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let issuesLabel: MTPaddingLabel = {
        let label = MTPaddingLabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.text = "90 Issues"
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 15.0
        label.paddingLeft = 8
        label.paddingRight = 8
        label.paddingTop = 4
        label.paddingBottom = 4
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "Gray")
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        
    }
    
    private func configureUI() {
        configurePosterImage()
        configureComicLabel()
        configureModifiedLabel()
        configureTypeLabel()
        configureIssuesLabel()
    }
    
    private func configurePosterImage() {
        contentView.addSubview(posterImage)
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            posterImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            posterImage.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
        ])
    }
    
    private func configureComicLabel() {
        contentView.addSubview(comicLabel)
        NSLayoutConstraint.activate([
            comicLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            comicLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 10)
        ])
    }
    
    private func configureModifiedLabel() {
        contentView.addSubview(modifiedLabel)
        NSLayoutConstraint.activate([
            modifiedLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            modifiedLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 10)
        ])
    }
    
    private func configureTypeLabel() {
        contentView.addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.bottomAnchor.constraint(equalTo: modifiedLabel.topAnchor, constant: 0),
            typeLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 10)
        ])
    }
    
    private func configureIssuesLabel() {
        contentView.addSubview(issuesLabel)
        NSLayoutConstraint.activate([
            issuesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            issuesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
        ])
    
    }
    
   
}
