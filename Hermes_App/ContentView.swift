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
                    .background(esLogin ? Color.buttonSelected : Color.fieldBackground)
                    .foregroundColor(esLogin ? .white : Color.buttonSelected)
                    .cornerRadius(20)

                    Button("Registrarse") {
                        esLogin = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(esLogin ? Color.fieldBackground : Color.buttonSelected)
                    .foregroundColor(esLogin ? Color.buttonSelected : .white)
                    .cornerRadius(20)
                }

                if esLogin == false {
                    Text("Nombre")
                        .foregroundColor(Color.typography)
                    TextField("Nombre", text: $nombre)
                        .padding()
                        .background(Color.fieldBackground)
                        .cornerRadius(15)
                }

                Text("Correo electrónico")
                    .foregroundColor(Color.typography)
                TextField("Correo electrónico", text: $correo)
                    .padding()
                    .background(Color.fieldBackground)
                    .cornerRadius(15)

                Text("Contraseña")
                    .foregroundColor(Color.typography)
                SecureField("Contraseña", text: $contrasena)
                    .padding()
                    .background(Color.fieldBackground)
                    .cornerRadius(15)

                if esLogin {
                    Text("¿Olvidaste tu contraseña?")
                        .font(.caption)
                        .foregroundColor(Color.buttonSelected)
                }

                Spacer()


                Button("Continuar") {
                    print("Continuar")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.buttonDisabled)
                .foregroundColor(Color.textDisabled)
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
