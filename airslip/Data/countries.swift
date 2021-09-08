//
//  countries.swift
//  countries
//
//  Created by Tibor Hanis on 06/09/2021.
//

import Foundation


class Countries: Codable, ObservableObject {
    @Published var id: String
    @Published var place: String
    @Published var population: Int
    @Published var currency: String
    @Published var date: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case place
        case population
        case currency
        case date
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(place, forKey: CodingKeys.place)
        try container.encode(population, forKey: CodingKeys.population)
        try container.encode(currency, forKey: CodingKeys.currency)
        try container.encode(date, forKey: CodingKeys.date)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        place = try values.decode(String.self, forKey: .place)
        population = try values.decode(Int.self, forKey: .population)
        currency = try values.decode(String.self, forKey: .currency)
        date = try values.decode(String.self, forKey: .date)

    }
    
//    init() {
//    }
}
