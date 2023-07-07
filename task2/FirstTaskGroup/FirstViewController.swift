//
//  FirstViewController.swift
//  task2
//
//  Created by Maxim Korolyuk on 06.07.2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    let cellWithImageAndText = "cellWithImageAndText"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        
        return tableView
    }()
    
    let arrayWithImagesAndText: [CellWithImageAndTextViewModel] = [
        
        CellWithImageAndTextViewModel(picture: FirstTaskConstants.Pictures.picOfAustria ?? UIImage(),
                                      description: FirstTaskConstants.Countries.austria),
        
        CellWithImageAndTextViewModel(picture: FirstTaskConstants.Pictures.picOfBelgium ?? UIImage(),
                                      description: FirstTaskConstants.Countries.belgium),
        
        CellWithImageAndTextViewModel(picture: FirstTaskConstants.Pictures.picOfFrance ?? UIImage(),
                                      description:FirstTaskConstants.Countries.france),
        
        CellWithImageAndTextViewModel(picture: FirstTaskConstants.Pictures.picOfGermany ?? UIImage(),
                                      description: FirstTaskConstants.Countries.germany),
        CellWithImageAndTextViewModel(picture: FirstTaskConstants.Pictures.picOfGreece ?? UIImage(),
                                      description: FirstTaskConstants.Countries.greece)
    ]
    
    private func setupView() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        tableView.rowHeight = 150
        tableView.register(CellWithImageAndText.self,
                           forCellReuseIdentifier: "cellWithImageAndText")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupView()
        setupConstraints()
    }
    
}

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayWithImagesAndText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    cellWithImageAndText) as? CellWithImageAndText
        let viewModel = arrayWithImagesAndText[indexPath.row]
        cell?.configureFirst(viewModel)
        return cell ?? UITableViewCell()
    }
    
}

extension FirstViewController: UITableViewDelegate {
    
}

