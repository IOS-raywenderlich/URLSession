//
//  TrackCell.swift
//  ITunesApp
//
//  Created by 장일규 on 2022/03/02.
//

import Foundation
import UIKit

//
// MARK: - Track Cell Delegate Protocol
//
protocol TrackCellDelegate {
  func downloadTapped(_ cell: TrackCell)
}

class TrackCell: UITableViewCell{
    
    // 
    var delegate: TrackCellDelegate?
    
    //
    // MARK: - init
    //
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder Decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // MARK: - setComponent
    //
    var artistNameLabel: UILabel = {
        let artistNameLabel = UILabel()
        artistNameLabel.font = .boldSystemFont(ofSize: 20)
        
        return artistNameLabel
    }()
    
    var trackNameLabel: UILabel = {
      let trackNameLabel = UILabel()
        trackNameLabel.font = .systemFont(ofSize: 10)
        trackNameLabel.textColor = .gray

        return trackNameLabel
    }()
    
    let downloadButton: UIButton = {
        let downloadButton = UIButton()
        downloadButton.setTitle("download", for: .normal)
        downloadButton.backgroundColor = .clear
        downloadButton.setTitleColor(.black, for: .normal)
        
        return downloadButton
    }()
    
    //
    // MARK: - setup
    //
    func setup() {
        addViews()
        setConstraints()
    }
    
    func addViews() {
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(downloadButton)
    }
    
    func setConstraints() {
        artistNameLabelConstraints()
        trackNameLabelConstraints()
        downloadButtonConstraints()
    }
    
    func artistNameLabelConstraints() {
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10).isActive = true
    }
    
    func trackNameLabelConstraints() {
        trackNameLabel.translatesAutoresizingMaskIntoConstraints = false
        trackNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor,constant: 5).isActive = true
        trackNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11).isActive = true
        trackNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10).isActive = true
    }
    func downloadButtonConstraints() {
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
