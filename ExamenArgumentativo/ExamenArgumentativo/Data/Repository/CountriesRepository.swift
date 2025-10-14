//
//  CountryRepository.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//

import Foundation

struct CountriesAPI {
    static let base = "https://restcountries.com/v3.1"
    struct routes {
        static let all = "/all?fields=name"
        static let name = "/name/"
    }
}
