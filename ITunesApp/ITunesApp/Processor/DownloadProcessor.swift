//
//  DownloadProcessor.swift
//  ITunesApp
//
//  Created by 장일규 on 2022/03/06.
//

import Foundation

class DownloadProcessor {
    //
    // MARK: - Variables And Properties
    //
    var activeDownloads: [URL: Download] = [ : ]
    
    /// SearchViewController creates downloadsSession
    var downloadsSession: URLSession!

    func startDownload(_ track: Track.Results) {
      var download = Download(track: track)
      download.task = downloadsSession.downloadTask(with: track.previewUrl)
      download.task?.resume()
      activeDownloads[download.track.previewUrl] = download
    }
}
