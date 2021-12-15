//
//  MainScreenEntity.swift
//  randomPerson
//
//  Created by Captain Kidd on 15.12.2021.
//

import Foundation

struct ResponseAPI: Codable {
    var results: [RandomUser]
}

struct RandomUser: Codable {
    var gender: String
    var name: Name
    var location: Location
    var email: String
    var phone: String
    var cell: String
    var picture: Picture
}


struct Name: Codable {
    var title: String
    var first: String
    var last: String
}

struct Location: Codable {
    var city: String
    var country: String
    var postcode: Int
}

struct Picture: Codable {
    var medium: String
}
