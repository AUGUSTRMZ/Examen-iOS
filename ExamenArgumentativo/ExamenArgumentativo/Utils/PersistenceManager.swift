//
//  PersistenceManager.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//

import Foundation


// Clase para manejar el almacenamiento local de datos simples del examen
class PersistenceManager {
    
    // Singleton
    static let shared = PersistenceManager()
    private init() {}
    
    private let defaults = UserDefaults.standard
    
    // Keys
    private enum Keys {
        static let countries = "countries_cache"
        static let lastCountry = "last_country"
    }
    
    // Guardar lista de países
    func saveCountries(_ countries: [Country]) {
        do {
            let data = try JSONEncoder().encode(countries)
            defaults.set(data, forKey: Keys.countries)
            print("Paises guardados en cache local")
        } catch {
            print("Error al guardar paises: \(error)")
        }
    }
    
    // Cargar lista de países
    func loadCountries() -> [Country]? {
        guard let data = defaults.data(forKey: Keys.countries) else { return nil }
        do {
            let decoded = try JSONDecoder().decode([Country].self, from: data)
            print("Paises cargados desde cache local")
            return decoded
        } catch {
            print("Error al leer países desde cache: \(error)")
            return nil
        }
    }
    
    // Guardar último país consultado
    func saveLastCountry(_ name: String) {
        defaults.set(name, forKey: Keys.lastCountry)
        print("Ultimo pais guardado: \(name)")
    }
    
    // Cargar último país consultado
    func loadLastCountry() -> String? {
        let last = defaults.string(forKey: Keys.lastCountry)
        print("Ultimo pais visitado: \(last ?? "Ninguno")")
        return last
    }
    
    // Borrar caché
    func clearCache() {
        defaults.removeObject(forKey: Keys.countries)
        defaults.removeObject(forKey: Keys.lastCountry)
        print("Cache limpiada")
    }
}
