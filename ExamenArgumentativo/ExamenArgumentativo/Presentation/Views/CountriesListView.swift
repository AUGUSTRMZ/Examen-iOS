//
//  CountriesListView.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//


import SwiftUI

struct CountriesListView: View {
    @StateObject private var vm = CountriesViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.countries, id: \.name.common) { country in
                NavigationLink(destination: CountryDetailView(countryName: country.name.common)) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(country.name.common)
                            .font(.headline)
                        Text(country.name.official)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Países")
            .task {
                // Llamamos la función del ViewModel
                await vm.getCountries()
            }
        }
    }
}

#Preview {
    CountriesListView()
}
