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
    
    private var requirement: CountriesRequirementProtocol
    
    init(requirement: CountriesRequirementProtocol = CountriesRequirement.shared) {
        self.requirement = requirement
    }
    
    @MainActor
    func getCountries() async {
        if let response = await requirement.getCountries() {
            self.countries = response
        } else {
            print("Unable to get Countries")
        }
        
    }
    
    @MainActor
    func getCountryDetail(name: String) async {
        if let response = await requirement.getCountryDetail(name: name), let first = response.first {
            self.countryDetail = first
        } else {
            print("Unable to get Country Detail")
        }
    }

}


