//
//  Brewery.swift
//  Breweries
//
//  Created by Slack, Ed (AMM) on 11/06/2024.
//

import Foundation

struct Brewery: Codable {
    let id: String
    let name: String
    let country: String
    let state: String
    let city: String
    let url: String
}
