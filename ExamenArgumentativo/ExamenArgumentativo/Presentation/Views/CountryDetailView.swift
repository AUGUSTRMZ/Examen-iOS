//
//  CountryDetailView.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//

import Foundation
import SwiftUI

struct CountryDetailView: View {
    let countryName: String
    @StateObject private var vm = CountriesViewModel()
    
    var body: some View {
        ScrollView {
            if let detail = vm.countryDetail {
                VStack(alignment: .leading, spacing: 10) {
                    Text(detail.name.common) // nombre del pais
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Divider()
                     // tarjeeta simple donde meter los datos
                    VStack(alignment: .leading, spacing: 10) {
                        Text(" Región: \(detail.region ?? "Desconocida")") // region
                        Text(" Subregión: \(detail.subregion ?? "Desconocida")") // subregion
                        
                        if let currencies = detail.currencies {
                            ForEach(currencies.keys.sorted(), id: \.self) { key in
                                if let currency = currencies[key] {
                                    Text("Moneda: \(currency.name ?? "Desconocido") (\(currency.symbol ?? "No encontrado"))")
                                }
                            }
                        }
                        
                        if let borders = detail.borders {
                            Text("Fronteras: \(borders.joined(separator: ", "))") // fronteras
                        }
                        
                        if let languages = detail.languagues {
                            Text("Idiomas: \(languages.values.joined(separator: ", "))") // idiomas
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: .gray.opacity(0.5), radius: 5)
                    .font(.body)
                    
                    }
                    

            } else {
                ProgressView("Cargando detalles...") // pantalla de carga
            }
        }
        
        .task {
            await vm.getCountryDetail(name: countryName) // uso de la funcion get
        }
    }
}

#Preview {
    CountryDetailView(countryName: "Mexico")
}
