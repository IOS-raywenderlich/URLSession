//
//  EndPoint.swift
//  ITunesApp
//
//  Created by 장일규 on 2022/03/02.
//

import Foundation

let baseURL: String = "https://itunes.apple.com/search"

enum ITunesURL: CustomStringConvertible {
    case searchTerm(item: String)
    
    var description: String {
        switch self {
            case .searchTerm(let item):
            return baseURL + "/media=music&entity=song&term=\(item)"
        }
    }
    
}
