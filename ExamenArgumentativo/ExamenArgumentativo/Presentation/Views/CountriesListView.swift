//
//  CountriesListView.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//


import SwiftUI


struct CountriesListView: View {
    @StateObject private var vm = CountriesViewModel()
    @State private var search = "" // variable donde se guarda para buscar pais
    @State private var showHookAlert = false // mostar el hookalert
    
    //  Busqueda local
    var filteredCountries: [Country] {
        if search.isEmpty { // si serach no tiene un valor muestra la lista completa
            return vm.countries
        } else {
            return vm.countries.filter { // si no buscar el nombre comun del pais
                $0.name.common.lowercased().contains(search.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.3), .green.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    // Barra de busqueda simple
                    HStack {
                        Image(systemName: "magnifyingglass") // lupita :D
                            .foregroundColor(.gray)
                        TextField("Buscar", text: $search) // campo de texto para asignar un valor a search y llamar la funcion de filtrar
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(12)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Resultados de los paises
                    if let error = vm.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        // lista con los paises filtrados por nombre comun
                        List(filteredCountries, id: \.name.common) { country in
                            NavigationLink(destination: CountryDetailView(countryName: country.name.common)) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(country.name.common)
                                        .font(.headline)
                                    Text(country.name.official)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding(6)
                            }
                            .listRowBackground(Color.white.opacity(0.8))
                        }
                        .scrollContentBackground(.hidden)
                        .listStyle(PlainListStyle())
                    }
                }
                .navigationTitle("Países")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { // boton que muestra el hook alert
                            showHookAlert = true
                        }) {
                            Image(systemName: "info.circle")
                        }
                    }
                }
                .alert("Detalles del Proyecto", isPresented: $showHookAlert) {
                    Button("Cerrar", role: .cancel) { }
                } message: {
                    Text(ProjectConstants.selfExplainedText)
                }
                .task {
                    await vm.getCountries()
                }
            }
        }
    }
}

#Preview {
    CountriesListView()
}
