//
//  BreweryWebAdaptor.swift
//  Breweries
//
//  Created by Slack, Ed (AMM) on 11/06/2024.
//

import Foundation

class BreweryWebAdaptor {
    static let shared = BreweryWebAdaptor()
    
    private init() {}
    
    private let baseUrl = "https://api.openbrewerydb.org/v1/breweries/"
    private let decoder = JSONDecoder()
    
    func search(for query: String, completion: @escaping ([LightweightBrewery]) -> Void) {
        //make a URL object
        let query = "autocomplete?query=\(query)"
        guard let url = (URL(string: baseUrl + query)) else {
            print("Invalid URL")
            return
        }
        
        //make a URLSession dataTask (object for calling a web api using a url)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let results = try? self.decoder.decode([LightweightBrewery].self, from: data) else {
                print("Error decoding JSON")
                return
            }
            
            completion(results)
        }
        
        //run this dataTask (initiate)
        task.resume()
    }
    
    func breweryData(for id: String, completion: @escaping (Brewery) -> Void) {
        //make a URL object
        guard let url = (URL(string: baseUrl + id)) else {
            print("Invalid URL")
            return
        }
        
        //make a URLSession dataTask (object for calling a web api using a url)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let result = try? self.decoder.decode(Brewery.self, from: data) else {
                print("Error decoding JSON")
                return
            }
            
            completion(result)
        }
        
        //run this dataTask (initiate)
        task.resume()
    }
}
