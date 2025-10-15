    //
    //  APIService.swift
    //  ExamenArgumentativo
    //
    //  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
    //

    import Foundation
    import Alamofire

    struct APIService {
        
        // metodo para obtener los stats del perfil
          func getCountries(url: URL) async -> [Country]? {
              print("url: \(url)")
              
              // GET al endpoint
              let taskRequest = AF.request(url, method: .get).validate()
              let response = await taskRequest.serializingData().response
              
              switch response.result {
              case .success(let data):
                  print("Succesfully got the countries")
                  // imprimir el json para verificar
                  if let jsonString = String(data:data, encoding: .utf8){
                      print("JSON: \(jsonString)")
                  }
                  
                  do {
                      // api debe devolver un array
                      return try JSONDecoder().decode([Country].self, from: data)
                  } catch {
                      print("Error decoding Country list: \(error)")
                      return nil
                  }
              case let .failure(error):
                  print("Could not connect to API")
                  debugPrint(error.localizedDescription)
                  return nil
                  
              }
          }
        
        
        // metodo para obtener los stats del perfil
          func getCountryDetail(url: URL) async -> [CountryDetail]? {
              print("url: \(url)")
              
              // GET al endpoint
              let taskRequest = AF.request(url, method: .get).validate()
              let response = await taskRequest.serializingData().response
              
              switch response.result {
              case .success(let data):
                  print("Succesfully got the Country Details")
                  // imprimir el json para verificar
                  if let jsonString = String(data:data, encoding: .utf8){
                      print("JSON: \(jsonString)")
                  }
                  
                  do {
                      // api debe devolver un array
                      return try JSONDecoder().decode([CountryDetail].self, from: data)
                  } catch {
                      print("Error decoding CountryDetail: \(error)")
                      return nil
                  }
              case let .failure(error):
                  print("Could not connect to API")
                  debugPrint(error.localizedDescription)
                  return nil
                  
              }
          }
        
        
        
        
        
        
        
        
    }
