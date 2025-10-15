//
//  CountryRequirement.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//

import Foundation

// protocolo requirement
protocol CountriesRequirementProtocol {
    func getCountries() async -> [Country]?
    func getCountryDetail(name: String) async -> [CountryDetail]?
}


// intermediario entre viewmodel y repository

class CountriesRequirement: CountriesRequirementProtocol {
    let dataRepository: CountriesRepository
    static let shared = CountriesRequirement() // singleton
    
    init(dataRepository: CountriesRepository = CountriesRepository.shared){
        self.dataRepository = dataRepository
    }
    
    func getCountries() async -> [Country]? {
        return await dataRepository.getCountries()
    }
    
    func getCountryDetail(name:String) async -> [CountryDetail]? {
        return await dataRepository.getCountryDetail(name: name)
    }
}
