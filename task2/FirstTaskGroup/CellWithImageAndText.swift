//
//  CellWithImageAndText.swift
//  task2
//
//  Created by Maxim Korolyuk on 06.07.2023.
//

import UIKit

// ImageAndTextTableViewCell
final class CellWithImageAndText: UITableViewCell {
    
    private lazy var labelText: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.contentMode = .scaleToFill
        label.font = label.font.withSize(20)
        
        return label
    }()
    
    private lazy var imageFrame: UIImageView = {
        let imageFrame = UIImageView()
        imageFrame.layer.cornerRadius = 15
        imageFrame.clipsToBounds = true
        
        return imageFrame
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        
        stackView.addArrangedSubview(imageFrame)
        stackView.addArrangedSubview(labelText)
        return stackView
    }()
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configureFirst(_ viewModel: CellWithImageAndTextViewModel) {
        imageFrame.image = viewModel.picture
        labelText.text = viewModel.description
        contentView.addSubview(stackView)
        
        setupConstraints()
    }
}
