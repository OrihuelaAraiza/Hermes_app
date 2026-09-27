//
//  ContentView.swift
//  To Do List
//
//  Created by Elian Payan on 20/09/26.
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var progreso = 0
    let fecha = Fecha(dia: 20, mes: "Septiembre", año: 2026)
    
    var body: some View {
        ZStack {
            Color(.blancouwu)
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Encabezado(fecha: fecha)
                        
                        HStack(spacing: 15) {
                            ForEach(Semanas.Semana /*,id: \.id*/) {
                                dia in Casilla(dia: dia,
                                               seleccionado: dia.numero == fecha.dia)
                            }
                        }
                        
                        Cuerpo(nombre: "Yoss",
                               frase: "Recuerda: Los pollitos dicen pío, pío, pío",
                               progreso: $progreso)
                        
                        Divider()
                        
                        Text("Your today´s tasks")
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .foregroundColor(.cafeuwu)
                        
                        ForEach(Recordatorios.Recordatorio/*,id: \.id*/) {
                            recordatorio in Filita(recordatorio: recordatorio)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
