//
//  SplashView.swift
//  To Do List
//
//  Created by Elian Payan on 22/09/26.
//
import SwiftUI

struct SplashView: View {
    //@Binding var cargo: Bool
    @State var giro: Double = 0
    @State var brilla = false
    var body: some View {
        ZStack
        {
            Color("blancouwu")
                .ignoresSafeArea()
            VStack(spacing: -90) {
                ZStack {
                    Image("magouwu")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300,
                               height: 300)
                        .rotationEffect(.degrees(giro))
                        .padding(.trailing, 60)
                    Image("brillouwu")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400,
                               height: 400)
                        .opacity(brilla ? 1 : 0.2)
                        .scaleEffect(brilla ? 1 : 0.5)
                        .padding(.leading, 220)
                }
                Text("wish do!")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.cafeuwu)
                    .padding(.bottom, 100)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.75)
                            .repeatForever(autoreverses: true)) {
                brilla = true
                giro = 20
            }
        }
    }
}

#Preview {
    SplashView()
}
