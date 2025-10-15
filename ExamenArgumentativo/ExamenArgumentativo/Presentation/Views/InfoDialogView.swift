//
//  InfoDialogView.swift
//  ExamenArgumentativo
//
//  Created by Cesar Augusto  Ramirez Davila on 14/10/25.
//

import Foundation

struct ProjectConstants {
    static let selfExplainedText = """
        Arquitectura:
        Para este proyecto utilice el modelo MVVM usando clean architecture
        con lo que separe por capas cada funcionalidad:
        * Data (Models, Network, Repositories)
        * Domain (Requirements)
        * Presentation (Views, ViewModels)
        * Utils (PersistenceManager)
        
        Interfaz de dominio real: CountryRequirement
        
        
        Estrategia de guardado:
        Use el archivo "PersistenceManager" donde se guarda en el cache local el ultimo pais guardado
        y descargar la lista de paises, esto permite que la aplicacion pueda reabrirse sin conexion manteniendo su estado
        anterior
        
        
        Estrategia de busqueda:
        Uso una funcion de filtrado local con una barra de busqueda hecha en HStack sobre el arreglo de los paises que coincidan con 
        el nombre comun de estos paises, entonces si se intenta buscar con el nombre oficial no se puede
        """
}
