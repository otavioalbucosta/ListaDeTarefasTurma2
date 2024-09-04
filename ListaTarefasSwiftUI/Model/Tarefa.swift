//
//  Tarefa.swift
//  ListaTarefasSwiftUI
//
//  Created by Otávio Albuquerque on 27/08/24.
//
import Foundation

struct Tarefa: Identifiable, Codable {
    
    var id = UUID()
    var nome: String

    var data = Date()
    var completa = false
}
