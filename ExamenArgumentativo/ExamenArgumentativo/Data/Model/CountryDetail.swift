//
//  CountryDetaili.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//

import Foundation

/*
 del mismo modo creo que es relevante mostrar la informacion de cada pais
 para asegurarnos de que sean datos que en teoria estan dispoibles en todos los paises
 vamos a usar el nombre, currencies, region y subregion, borders y languagues  en la que se encuentran
 */

struct CountryDetail: Codable, Identifiable {
    var id: String { name.common }
    
    let name: CountryName
    let currencies: [String: Currency]? // devuelve mas de una cosa
    let region: String?
    let subregion: String?
    let borders: [String]? // arreglo porque es mas de una
    let languagues: [String: String]? // porque es lenguaje abreviado y completo
    
    
    struct CountryName: Codable { // nombre del pais
        let common: String
        let official: String
    }
    
    struct Currency: Codable { // tipo de moneda o cambio
        let name: String?
        let symbol: String?
    }
    
}
