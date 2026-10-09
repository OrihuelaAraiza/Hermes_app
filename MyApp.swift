import SwiftUI

@main
struct MiApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @State var carga = true
    @State var sesion = false
    
    var body: some View {
        ZStack {
                if carga {
                    SplashView(carga: $carga)
                        .transition(.opacity)
                } else if sesion {
                    ContentView()
                        .transition(.move(edge: .trailing))
                } else {
                    StartView(sesion: $sesion)
                        .transition(.opacity)
                }
        } .task {
            await prepareApp()
            withAnimation(.easeOut(duration: 0.4)) {
                carga = false
            }
        }
    }
    
    private func prepareApp() async {
        async let minimumDelay: Void = {
            try? await Task.sleep(for: .seconds(1.5))
        }()
        _ = await minimumDelay
    }
}

#Preview {
    RootView()
}
