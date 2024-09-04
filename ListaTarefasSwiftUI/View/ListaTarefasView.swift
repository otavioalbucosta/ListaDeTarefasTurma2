//
//  ListaTarefasView.swift
//  ListaTarefasSwiftUI
//
//Users/otavioalbuquerque/Documents/ListaTarefasSwiftUI/ListaTarefasSwiftUI/Preview Content/  Created by Otávio Albuquerque on 27/08/24.
//

import SwiftUI



struct ListaTarefasView: View {
    
    @ObservedObject var viewModel = TarefasViewModel()

    
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.listaTarefas) { $tarefa in
                    NavigationLink {
                        DetalhesTarefaView(tarefa: $tarefa)
                            .onDisappear {
                                viewModel.escrever()
                            }
                    } label: {
                        HStack {
                            Text(tarefa.nome)
                            Spacer()
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(tarefa.completa ? Color.green : Color.black)
                        }
                    }


                }
                .onDelete { index in
                    viewModel.removerItemLista(index: index)
                }
                
                
                Section {
                    Button("Adicionar") {
                        
                        viewModel.isEditing = true
                        // se false -> true
                        // se true -> false
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isEditing) {
            VStack {
                TextField("Escreva a sua tarefa", text: $viewModel.novaTarefa)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Enviar") {
                    viewModel.adicionarTarefa()
                }
            }
            
        }
        .onAppear {
            viewModel.ler()
        }
    }
    
}

#Preview {
    ListaTarefasView()
}
