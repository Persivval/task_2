//
//  SecondViewController.swift
//  task2
//
//  Created by Maxim Korolyuk on 06.07.2023.
//



import UIKit

extension Date {
    public var removeTimeStamp : Date? {
        guard let date = Calendar.current.date(from:
                                                Calendar.current.dateComponents([.year, .month, .day],
                                                                                from: self)
        ) else {
            return nil
        }
        return date
    }
}


class SecondViewController: UIViewController {
    
    let newsCellIdentifier = "newsCellIdentifier"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    func convertToDateArray() -> [NewsRecordDateModel] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'ssZZZ"
        var array: [NewsRecordDateModel]  = []
        for element in models {
            let cell = NewsRecordDateModel(title: element.title,
                                           publishedAt: formatter.date(from: element.publishedAt)  ?? Date() )
            array.append(cell)
        }
        return array
    }
    
    func convertToGroupingDict() -> [Date: [NewsRecordDateModel]] {
        let arrayWithDate = convertToDateArray()
        let groupedDictionary = Dictionary(grouping: arrayWithDate,
                                           by: { $0.publishedAt.removeTimeStamp ?? Date()})
        return groupedDictionary
    }
    
    func createSectionedArray() -> [TableSectionsModel] {
        let groupedDictionary = convertToGroupingDict()
        var sections: [TableSectionsModel] = []
        for element in groupedDictionary {
            let section = TableSectionsModel(publicationDate: element.key,
                                             cell: element.value)
            sections.append(section)
        }
        
        return sections.sorted(by: {$0.publicationDate < $1.publicationDate})
    }
    
    var sections: [TableSectionsModel] = []
    
    
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
        tableView.rowHeight = 100
        
        tableView.register(NewsCell.self, forCellReuseIdentifier: newsCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        sections = createSectionedArray()
        
        setupView()
        setupConstraints()
    }
}


extension SecondViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        let date = section.publicationDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.cell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCellIdentifier) as? NewsCell
        let section = self.sections[indexPath.section]
        let viewModel = section.cell[indexPath.row]
        cell?.configureSecond(viewModel)
        return cell ?? UITableViewCell()
    }
    
}

extension SecondViewController: UITableViewDelegate {}
