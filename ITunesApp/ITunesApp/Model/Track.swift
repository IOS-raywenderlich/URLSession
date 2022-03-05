//
//  Track.swift
//  ITunesApp
//
//  Created by 장일규 on 2022/03/05.
//

import Foundation

struct Track: Codable {
    struct Results: Codable {
        let artistName: String
        let trackName: String
        let previewUrl: URL
    }

    let resultCount: Int
    let results: [Results]

}
