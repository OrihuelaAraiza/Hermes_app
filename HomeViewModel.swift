//
//  ContentViewModel.swift
//  To Do List
//
//  Created by Elian Payan on 20/09/26.
//
import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
}

struct Fecha: Hashable {
    let dia: Int
    let mes: String
    let año: Int
}

struct Dia: Hashable, Identifiable {
    let id = UUID()
    let nombre: String
    let numero: Int
}

struct Semanas {
    static let Semana = [
        Dia(nombre: "Lunes", numero: 18),
        Dia(nombre: "Martes", numero: 19),
        Dia(nombre: "Miercoles", numero: 20),
        Dia(nombre: "Jueves", numero: 21),
        Dia(nombre: "Viernes", numero: 22),
        Dia(nombre: "Sábado", numero: 23),
        Dia(nombre: "Domingo", numero: 24)]
}

struct Casilla: View {
    let dia: Dia
    var seleccionado = false
    var body: some View {
        VStack {
            Text(dia.nombre.prefix(3))
            .font(.system(size: 15, weight: .semibold, design: .default))
            .foregroundColor(seleccionado ? .negrouwu : .grisoscurouwu)
            .padding(.top, 10)
        }
        .frame(width: 40, height: 55, alignment: .top)
        .background(seleccionado ? Color.grisoscurouwu : Color.grisclarouwu)
        .cornerRadius(10)
    }
}

struct Encabezado: View {
    var fecha: Fecha
    var body: some View {
        VStack (spacing: 15) {
            Text("\(fecha.mes.prefix(3)). \(fecha.dia) —\(fecha.año)")
                .font(.system(size: 25, weight: .bold, design: .default))
                .foregroundColor(.negrouwu)
                .padding(.top)
        }
    }
}

struct Cuerpo: View {
    var nombre: String
    var frase: String
    @Binding var progreso: Int
    var body: some View {
        HStack (spacing: 10) {
            Image("magouwu")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130,
                       height: 130)
            VStack(alignment: .leading, spacing: 10) {
                Text("Hi, \(nombre)!")
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundColor(.negrouwu)
                Text("\(frase)!")
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(.negrouwu)
            }
            Spacer()
            ZStack {
                Image(systemName: "circle.fill" )
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .foregroundStyle(.grisoscurouwu)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75,
                           height: 75)
                Image(systemName: "circle" )
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .foregroundStyle(.grisoscurouwu)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,
                           height: 100)
                Text("\(progreso)%")
                    .font(.system(size: 25, weight: .regular, design: .default))
                    .foregroundColor(.blancouwu)
            }
        }
    }
}

struct Pendiente: Hashable, Identifiable {
    var completado = false
    let id = UUID()
    let nombre: String
    let urgencia: String
    let fecha: Fecha
    let lista: String
}

struct Recordatorios {
    static let Recordatorio = [
        Pendiente(nombre: "Tarea de Quimica", urgencia: "Media", fecha: Fecha(dia: 21, mes: "Septiembre", año: 2026), lista: "magazine"),
        Pendiente(nombre: "Presentacion de IOS", urgencia: "Alta", fecha: Fecha(dia: 26, mes: "Septiembre", año: 2026), lista: "swift"),
        Pendiente(nombre: "Bañar a los perros", urgencia: "Baja", fecha: Fecha(dia: 7, mes: "Octubre", año: 2026), lista: "apple.homekit"),
        Pendiente(nombre: "Examen de Calculo", urgencia: "Media", fecha: Fecha(dia: 18, mes: "Octubre", año: 2026), lista: "magazine"),
        Pendiente(nombre: "Depurar la bodega", urgencia: "Baja", fecha: Fecha(dia: 29, mes: "Octubre", año: 2026), lista: "apple.homekit"),
        Pendiente(nombre: "EXIL", urgencia: "Alta", fecha: Fecha(dia: 3, mes: "Noviembre", año: 2026), lista: "magazine"),
        Pendiente(nombre: "Proyecto de IOS", urgencia: "Media", fecha: Fecha(dia: 14, mes: "Noviembre", año: 2026), lista: "swift")]
}

struct Boton: View {
    var color: Color
    var imagen: String
    var body: some View {
        Image(systemName: imagen)
            .symbolRenderingMode(.monochrome)
            .resizable()
            .foregroundStyle(color)
            .frame(width: 25,
                    height: 25)
            .aspectRatio(contentMode: .fit)
    }
}

struct Filita: View {
    let recordatorio: Pendiente
    @State var completado = false
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: recordatorio.lista)
                .symbolRenderingMode(.monochrome)
                .resizable()
                .foregroundColor(.cafeuwu)
                .aspectRatio(contentMode: .fit)
                .padding(8)
                .frame(width: 60,
                       height: 60)
                .background(.blancouwu)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 6) {
                Text(recordatorio.nombre)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.negrouwu)
                Text("\(recordatorio.fecha.dia), \(recordatorio.fecha.mes)")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.negrouwu)
                    .padding(8)
                    .background(.amarillouwu)
                    .cornerRadius(10)
            }
            Spacer()
            Button {
                completado.toggle()
            }label: {
                Boton(color: completado ? .cafeuwu : .grisoscurouwu,
                      imagen: completado ? "circle.fill" : "circle.dashed")
            }
        }
        .padding()
        .background(.grisclarouwu)
        .cornerRadius(20)
    }
}
