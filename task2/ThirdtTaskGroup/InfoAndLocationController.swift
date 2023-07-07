//
//  InfoAndLocationController.swift
//  task2
//
//  Created by Maxim Korolyuk on 07.07.2023.
//

import UIKit

class InfoAndLocationController: UIViewController {
    
    private lazy var info: UILabel = {
        let label = UILabel()
        label.text = "Description: "
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var location: UILabel = {
        let label = UILabel()
        label.text = "Location:"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        //    label.backgroundColor = .systemPink
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        var label = UILabel()
        label.contentMode = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(info)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(location)
        stackView.addArrangedSubview(locationLabel)
        return stackView
    }()
    
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(stackView)
    }
    
    func configureInfoSreen(_ viewModel: NewsWithLocationModel) {
        descriptionLabel.text = viewModel.description
        locationLabel.text = viewModel.location
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
}
