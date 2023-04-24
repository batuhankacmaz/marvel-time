//
//  MTComicTableViewCell.swift
//  MarvelTime
//
//  Created by Batuhan Kacmaz on 24.04.2023.
//

import UIKit

class MTComicTableViewCell: UITableViewCell {
    
    static let identifier = "MTComicTableViewCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        contentView.backgroundColor = .blue
    }

}
