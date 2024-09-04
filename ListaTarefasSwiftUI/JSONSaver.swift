//
//  JSONSaver.swift
//  ListaTarefasSwiftUI
//
//  Created by Otávio Albuquerque on 29/08/24.
//

import Foundation

struct JSONSaver {
    
    let caminhoDoArquivo = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("tarefa.json")

    
    func escrever(_ tarefas: [Tarefa]) {
        do {
            let dados = try JSONEncoder().encode(tarefas)
            
            try dados.write(to: caminhoDoArquivo)
            
        } catch {
            print(error)
        }
    }
    
    func ler() -> [Tarefa] {
        do {
            var dados = try Data(contentsOf: caminhoDoArquivo)
            let tarefas = try JSONDecoder().decode([Tarefa].self, from: dados)
            return tarefas
        } catch {
            print(error)
        }
       
        return []
        
    }
    
}
