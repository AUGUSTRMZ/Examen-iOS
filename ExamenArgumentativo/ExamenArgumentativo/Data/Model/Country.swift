//
//  Country.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//

import Foundation

/*
 
 creacion del modelo para el api de countries
 como decision practica usare este para buscar los paises en una barra de busqueda entonces solo voy a extraer el nombre "common" del pais de este
 
 */

struct Country: Codable, Identifiable {
    var id: String {name.common} // id para identificar es el nombre common del pais
    let name: CountryName // nombre del pais
    
    struct CountryName: Codable {
        let common: String // nombre comun ej argentina
        let official: String // nombre oficial ej republica argentina
    }
}


