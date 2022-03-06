//
//  Download.swift
//  ITunesApp
//
//  Created by 장일규 on 2022/03/06.
//

import Foundation

struct Download {
    //
    // MARK: - Variables And Properties
    //
    var task: URLSessionDownloadTask?
    var track: Track

    //
    // MARK: - Initialization
    //
    init(track: Track) {
        self.track = track
    }
}
