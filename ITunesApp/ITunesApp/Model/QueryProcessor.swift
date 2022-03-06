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
    weak var delegate: QueryProcessorDelegate?
    var errorMessage = ""
    
    func fetchData(urlString: String, usage: ITunesURL) {
        guard let url = URL(string: urlString) else { return }
        
        var reqeust = URLRequest(url: url)
        reqeust.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) {
            [weak self] data, response, error in
            
            guard error == nil,
                  let httpResponse = (response as? HTTPURLResponse),
                  httpResponse.statusCode == 200,
                  
                    let data = data else {
                        self?.delegate?.didFailwith(error: error, response: response, usage: usage)
                        return
                    }
            
            self?.delegate?.didSucessWith(data: data, response: httpResponse, usage: usage)
        }
        dataTask.resume()
    }
}
