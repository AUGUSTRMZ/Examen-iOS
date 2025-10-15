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
            // lista de las misiones
            List(vm.countries, id: \.name.common) { country in
                NavigationLink(destination: CountryDetailView(countryName: country.name.common)) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(country.name.common) // nombre comun del pais
                            .font(.headline)
                        Text(country.name.official) // nombre oficial del pais en un texto como tipo secondary
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Países")
            .task {
                // Funcion get
                await vm.getCountries()
            }
        }
    }
}

#Preview {
    CountriesListView()
}
