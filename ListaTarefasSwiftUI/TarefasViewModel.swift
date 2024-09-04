//
//  TarefasViewModel.swift
//  ListaTarefasSwiftUI
//
//  Created by Otávio Albuquerque on 04/09/24.
//
import SwiftUI

class TarefasViewModel: ObservableObject {
    
    
    @Published var isEditing: Bool = false
    @Published var novaTarefa: String = ""
    
    @Published var listaTarefas: [Tarefa] = []
    
    
    func adicionarTarefa() {
        let novaTarefa = Tarefa(nome: novaTarefa)
        listaTarefas.append(novaTarefa)
        JSONSaver().escrever(listaTarefas)
        isEditing = false
    }
    
    func ler() {
        listaTarefas = JSONSaver().ler()
    }
    
    func removerItemLista(index: IndexSet) {
        listaTarefas.remove(atOffsets: index)
        JSONSaver().escrever(listaTarefas)
    }
    
    func escrever() {
        JSONSaver().escrever(listaTarefas)
    }
}
