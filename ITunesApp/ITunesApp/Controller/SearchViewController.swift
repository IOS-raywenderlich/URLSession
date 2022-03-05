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
    
    // MARK: - tabelView Property
    let searchBar = UISearchBar()
    var trackInfo: [Track.Results]?
    var resultCount: Int = 0
    
    // MARK: - queryProcessor
    var queryProcessor:QueryProcessor!
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        return tableView
    }()
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
      var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
      return recognizer
    }()
    
    @objc func dismissKeyboard() {
      searchBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        addViews()
        setConstraints()
        setConfigureTableView()
        setSearchBar()
        setCongigureQueryProcessor()
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
    
    func setSearchBar() {
        searchBar.placeholder = "곡명 또는 가수명을 검색해주세요."
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
    }

    func setCongigureQueryProcessor() {
        queryProcessor = QueryProcessor()
        queryProcessor.delegate = self
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
    //
    // MARK: - numberOfRowsInSection
    //
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return resultCount
    }
    
    //
    // MARK: - cellForRowAt
    //
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: identifier,
            for: indexPath
        ) as? TrackCell else { return UITableViewCell() }

        DispatchQueue.main.async {
            self.trackInfo.map { overView in
                cell.artistNameLabel.text = overView[indexPath.row].artistName
                cell.trackNameLabel.text = overView[indexPath.row].trackName
            }
        }
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        
        guard let searchText = searchBar.text, !searchText.isEmpty else {
          return
        }
        
        queryProcessor.fetchData(
            urlString: ITunesURL.searchTerm(item: searchText).description,
            usage: .searchTerm(item: searchText))
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
      view.addGestureRecognizer(tapRecognizer)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
      view.removeGestureRecognizer(tapRecognizer)
    }
}

extension SearchViewController: QueryProcessorDelegate {
    func didSucessWith(
        data: Data,
        response: URLResponse,
        usage: ITunesURL
    ) {
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
        guard let decoded = try? JSONDecoder().decode(Track.self, from: data) else { return }
        
        DispatchQueue.main.async {
            self.resultCount = decoded.resultCount
            self.tableView.reloadData()
        }
        
        self.trackInfo = decoded.results
    }
    
    func didFailwith(
        error: Error?,
        response: URLResponse?,
        usage: ITunesURL
    ) {
        
    }
    
    
}
