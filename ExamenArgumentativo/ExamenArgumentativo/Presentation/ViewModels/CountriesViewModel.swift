//
//  UserProfileViewModel.swift
//  habitree
//
//  Created by Cesar Augusto  Ramirez Davila on 08/10/25.
//

import Foundation
import Combine

class CountriesViewModel: ObservableObject {
    
    @Published var countries: [Country] = []
    @Published var countryDetail: CountryDetail?
    @Published var errorMessage: String?
    
    
    private var requirement: CountriesRequirementProtocol
    
    init(requirement: CountriesRequirementProtocol = CountriesRequirement.shared) {
        self.requirement = requirement
    }
    
    @MainActor
    func getCountries() async {
        errorMessage = nil
        
        if let response = await requirement.getCountries() {
            self.countries = response
            // guardar la lista de paises localmente
            PersistenceManager.shared.saveCountries(response)
            print("Se guardo localmente con exito")
        }else if let cached = PersistenceManager.shared.loadCountries(){
            // ver la lista localmente si no hay conexion
            self.countries = cached
        } else {
            self.errorMessage = "Unable to get Countries"
            print("No se encontraron paises ni en red ni en cache")
        }
    }
    
    @MainActor
    func getCountryDetail(name: String) async {
        if let response = await requirement.getCountryDetail(name: name), let first = response.first {
            self.countryDetail = first
            // guardar ultimo pais consultado
            PersistenceManager.shared.saveLastCountry(name)
            print("guardado pais \(name)")
        } else {
            errorMessage = "Unable to get Country Details for \(name)"
            print("Error al cargar el pais, no existe registro de un pais visitado previamente")
        }
    }

}


