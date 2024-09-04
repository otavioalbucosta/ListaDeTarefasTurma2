//
//  DetalhesTarefaView.swift
//  ListaTarefasSwiftUI
//
//  Created by Otávio Albuquerque on 27/08/24.
//

import SwiftUI

struct DetalhesTarefaView: View {
    @Binding var tarefa: Tarefa
    var body: some View {
        VStack {
            Text(tarefa.nome)
                .font(.title)
            Text(tarefa.data, style: .time)
                .padding(.bottom, 20)
            
            Toggle(isOn: $tarefa.completa) {
                Text("Está completa?")
            }
            .padding(.horizontal, 100)
        }

    }
}

#Preview {
    DetalhesTarefaView(tarefa: .constant(Tarefa(nome: "Teste")))
}
