//
//  AboutCountryTableViewCell.swift
//  CodingAssignmentAboutCountry
//
//  Created by Prerak on 21/12/20.
//  Copyright © 2020 PrerakHomePC. All rights reserved.
//

import UIKit
import SDWebImage

class AboutCountryTableViewCell: UITableViewCell {
    
    //Cell Title configuration
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        //label.backgroundColor = .yellow
        return label
    }()

    //Cell Image View configuration
    private lazy var cellImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        return imageView
    }()

    //Description Text configuration
    private lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        //label.backgroundColor = .blue
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //Adding of Subviews to TableView Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(cellImage)
        addSubview(descriptionLabel)
        designCell()
    }

    
    //Assigning values to control, Called from Table View Data Source
    var setCellDataObj: AboutCountryItemObject? {
        didSet {
            guard let itemObj = setCellDataObj else {
                return
            }
            self.titleLabel.text = itemObj.title ?? ""
            self.descriptionLabel.text = itemObj.description ?? ""
            self.cellImage.sd_setImage(with: URL(string: itemObj.imageHref ?? "" ), placeholderImage: UIImage(named: "PlaceHolder"))
        }
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //Setting up Autolayout Constrains Programmatically.
    func designCell()  {
        
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -10).isActive = true
            
            cellImage.translatesAutoresizingMaskIntoConstraints = false
            cellImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
            cellImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            cellImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
            cellImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
            
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10).isActive = true
            descriptionLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 10).isActive = true
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -10).isActive = true
        
    }
    
}
