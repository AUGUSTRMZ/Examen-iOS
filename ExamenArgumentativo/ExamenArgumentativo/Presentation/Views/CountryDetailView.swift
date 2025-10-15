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
                    Text(detail.name.common)
                        .font(.largeTitle)
                        .bold()
                    
                    Divider()
                    
                    Group {
                        Text(" Región: \(detail.region)")
                        Text(" Subregión: \(detail.subregion ?? "Desconocida")")
                    }
                    .font(.body)
                    
                    if let currencies = detail.currencies {
                        ForEach(currencies.keys.sorted(), id: \.self) { key in
                            if let currency = currencies[key] {
                                Text("Moneda: \(currency.name) (\(currency.symbol ?? ""))")
                            }
                        }
                    }
                    
                    if let borders = detail.borders {
                        Text("Fronteras: \(borders.joined(separator: ", "))")
                    }
                    
                    if let languages = detail.languagues {
                        Text("Idiomas: \(languages.values.joined(separator: ", "))")
                    }
                }
                .padding()
            } else {
                ProgressView("Cargando detalles...")
            }
        }
        .navigationTitle(countryName)
        .task {
            await vm.getCountryDetail(name: countryName)
        }
    }
}

#Preview {
    CountryDetailView(countryName: "Mexico")
}
