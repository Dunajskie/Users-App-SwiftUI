//
//  Response.swift
//  BitcoinApp
//
//  Created by Michał Dunajski on 02/09/2021.
//

import Foundation

struct Response: Codable, Identifiable {
    let id = UUID()
    var results: [PersonalData]
}

struct PersonalData: Codable {
    var gender: String
    var name: NameInfo
    var picture: Picture
    var location: Location
    var email: String
}

struct NameInfo: Codable {
    var title: String
    var first: String
    var last: String
}

struct Picture: Codable {
    var large: String
}

struct Location: Codable {
    var country: String
    var city: String
    var coordinates: Coordinate
}

struct Coordinate: Codable {
    var latitude: String
    var longitude: String
}

