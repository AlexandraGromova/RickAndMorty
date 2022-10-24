//
//  JSONResponse.swift
//  RickAndMortyApp
//
//  Created by Sasha on 19.10.2022.
//

import Foundation

struct Response: Codable {
    let results: [Result]
    let info: Info
}

struct Result: Codable {
    let id: Int
    let name: String
    let image: String
    let gender: Gender
    let species: Species
    let created: String
    let status: Status
    let url: String
}

struct Info: Codable {
    let count, pages: Int
    let next: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}
enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}
enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
