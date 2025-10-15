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


// Protocolo de Countries
protocol CountriesApiProtocol {
    func getCountries() async -> [Country]? // para la lista de paises
    func getCountryDetail(name: String) async -> [CountryDetail]? // para la informacion de cada pais
}


// repositorio para consumir y hacer la llamada HTTP
class CountriesRepository: CountriesApiProtocol {
    
    let nservice: APIService
    static let shared = CountriesRepository()
    
    init(nservice: APIService = APIService()) {
        self.nservice = nservice
    }
    
    //funcion que obtiene la lista de paises
    func getCountries() async -> [Country]? {
        let url = URL(string: "\(CountriesAPI.base)\(CountriesAPI.routes.all)")!
        return await nservice.getCountries(url: url)
    }
    
    //funcion que obtiene la info de un pais especifico por su nombre
    func getCountryDetail(name: String) async -> [CountryDetail]? {
        let encodeName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? name // para sacar el nombre del pais y ponerlo en el url
        let url = URL(string: "\(CountriesAPI.base)\(CountriesAPI.routes.name)\(encodeName)")!
        return await nservice.getCountryDetail(url: url)
    }
}

