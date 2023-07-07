//
//  NewsCell.swift
//  task2
//
//  Created by Maxim Korolyuk on 07.07.2023.
//


import UIKit

// NewTableViewCell
final class NewsCell: UITableViewCell {
    
    private lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.numberOfLines = .max
        return label
    }()
    
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        
        return label
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        
        stackView.addArrangedSubview(newsLabel)
        stackView.addArrangedSubview(dateLabel)
        
        return stackView
    }()
    
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    
    func configureSecond(_ viewModel: NewsRecordDateModel) {
        
        newsLabel.text = viewModel.title
        dateLabel.text = viewModel.publishedAt.formatted(date: .omitted, time: .shortened)
        //    dateLabel.text = "\(viewModel.publishedAt)"
        contentView.addSubview(stackView)
        setupConstraints()
    }
}
