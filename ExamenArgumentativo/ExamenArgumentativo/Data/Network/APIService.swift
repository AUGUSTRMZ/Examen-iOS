//
//  APIService.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//

import Foundation


struct APIService {
    
    static let shared = APIService()
    /*
     aqui tomo en cuenta que lo que retorna el JSON es un arreglo de multiples objetos entonces por eso los [] alrededor de Country
     similar a mi implementacion de la historia 3.15 sin usar alamofire
     */
    
    // funcion que obtiene todos los paises
    func getCountries(url: URL) async -> [Country]? {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("Error en http en getCountries: \(response)")
            return nil
        }
    }
    
    func getCountryDetail(url: URL) async -> [CountryDetail]?
}
