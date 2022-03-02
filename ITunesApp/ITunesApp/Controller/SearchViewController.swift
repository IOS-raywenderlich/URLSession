//
//  SearchViewController.swift
//  ITunesApp
//
//  Created by 장일규 on 2022/03/01.
//

import Foundation
import UIKit

let identifier = "TrackCell"
class SearchViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        addViews()
        setConstraints()
        setConfigureTableView()
    }
    
    
    func addViews() {
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        tableViewConstraints()
    }
    
    func setConfigureTableView() {
        tableView.register(TrackCell.self, forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }


    func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}


extension SearchViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 3
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

