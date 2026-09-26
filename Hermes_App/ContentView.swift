//
//  ContentView.swift
//  Hermes_App
//
//  Created by JP on 18/09/26.
//

import SwiftUI

struct ContentView: View {

    @State var nombre = ""
    @State var correo = ""
    @State var contrasena = ""
    @State var esLogin = true

    var body: some View {
        VStack(spacing: 0) {


            Image("papuDibujo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)

          
            VStack(alignment: .leading, spacing: 15) {

             
                HStack {
                    Button("Iniciar sesión") {
                        esLogin = true
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(esLogin ? Color.papuGris : Color.papuGrisClaro)
                    .foregroundColor(esLogin ? .white : Color.papuGris)
                    .cornerRadius(20)

                    Button("Registrarse") {
                        esLogin = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(esLogin ? Color.papuGrisClaro : Color.papuGris)
                    .foregroundColor(esLogin ? Color.papuGris : .white)
                    .cornerRadius(20)
                }

                if esLogin == false {
                    Text("Nombre")
                        .foregroundColor(Color.papuCafe)
                    TextField("Nombre", text: $nombre)
                        .padding()
                        .background(Color.papuGrisClaro)
                        .cornerRadius(15)
                }

                Text("Correo electrónico")
                    .foregroundColor(Color.papuCafe)
                TextField("Correo electrónico", text: $correo)
                    .padding()
                    .background(Color.papuGrisClaro)
                    .cornerRadius(15)

                Text("Contraseña")
                    .foregroundColor(Color.papuCafe)
                SecureField("Contraseña", text: $contrasena)
                    .padding()
                    .background(Color.papuGrisClaro)
                    .cornerRadius(15)

                if esLogin {
                    Text("¿Olvidaste tu contraseña?")
                        .font(.caption)
                        .foregroundColor(Color.papuGris)
                }

                Spacer()


                Button("Continuar") {
                    print("Continuar")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.papuBoton)
                .foregroundColor(Color.papuGrisTexto)
                .cornerRadius(15)
            }
            .padding(20)
        }
        .ignoresSafeArea(edges: .top)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    ContentView()
}
