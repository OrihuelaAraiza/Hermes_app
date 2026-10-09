//
//  StartView.swift
//  Hermes_App
//
//  Created by Elian Payan on 06/10/26.
//
import SwiftUI

struct StartView: View {
    @Binding var sesion: Bool
    @State var nombre = ""
    @State var correo = ""
    @State var contrasena = ""
    @State var esLogin = true

    var body: some View {
        ZStack {
            Color(.blancouwu)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Image("imageuwu")
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
                        .background(esLogin ? Color.grisoscurouwu : Color.grisclarouwu)
                        .foregroundColor(esLogin ? .blancouwu : Color.grisoscurouwu)
                        .cornerRadius(20)
                        
                        Button("Registrarse") {
                            esLogin = false
                        }
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(esLogin ? Color.grisclarouwu : Color.grisoscurouwu)
                        .foregroundColor(esLogin ? Color.grisoscurouwu : .blancouwu)
                        .cornerRadius(20)
                    }
                    
                    if esLogin == false {
                        Text("Nombre")
                            .foregroundColor(Color.negrouwu)
                        TextField("Nombre", text: $nombre)
                            .padding()
                            .background(Color.blancouwu)
                            .cornerRadius(15)
                    }
                    
                    Text("Correo electrónico")
                        .foregroundColor(Color.negrouwu)
                    TextField("Correo electrónico", text: $correo)
                        .padding()
                        .background(Color.blancouwu)
                        .cornerRadius(15)
                    
                    Text("Contraseña")
                        .foregroundColor(Color.negrouwu)
                    SecureField("Contraseña", text: $contrasena)
                        .padding()
                        .background(Color.blancouwu)
                        .cornerRadius(15)
                    
                    if esLogin {
                        Text("¿Olvidaste tu contraseña?")
                            .font(.caption)
                            .foregroundColor(Color.grisoscurouwu)
                    }
                    
                    Spacer()
                    
                    Button("Continuar") {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            sesion = true
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.grisoscurouwu)
                    .foregroundColor(Color.grisclarouwu)
                    .cornerRadius(15)
                }
                .padding(20)
            }
            .ignoresSafeArea(edges: .top)
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    StartView(sesion: .constant(false))
}
