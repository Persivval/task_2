//
//  ThirdViewController.swift
//  task2
//
//  Created by Maxim Korolyuk on 07.07.2023.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let cellWithTitleOnly = "cellWithTitleOnly"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
        view.backgroundColor = .systemGray2
        tableView.rowHeight = 70
        tableView.register(CellWithTitleOnly.self
                           , forCellReuseIdentifier: cellWithTitleOnly)
        tableView.dataSource = self
        tableView.delegate = self
        
        setupView()
        setupConstraints()
        
    }
    
}

extension ThirdViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelsWithLocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWithTitleOnly) as? CellWithTitleOnly
        let viewModel = modelsWithLocation[indexPath.row]
        cell?.configureThird(viewModel)
        return cell ?? UITableViewCell()
    }
    
}

extension ThirdViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = modelsWithLocation[indexPath.row]
        let destination = InfoAndLocationController()
        destination.configureInfoSreen(viewModel)
        navigationController?.pushViewController(destination, animated: true)
    }
    
}
