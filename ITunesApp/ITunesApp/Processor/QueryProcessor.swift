//
//  QueryProcessor.swift
//  ITunesApp
//
//  Created by 장일규 on 2022/03/03.
//

import Foundation

protocol QueryProcessorDelegate: AnyObject {
    func didSucessWith(data: Data, response: URLResponse, usage: ITunesURL)
    func didFailwith(error: Error?, response: URLResponse?, usage: ITunesURL)
}

class QueryProcessor {
    
}
