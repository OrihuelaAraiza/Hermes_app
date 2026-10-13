import SwiftUI

struct RootView: View {
    @State private var carga = true
    @State private var sesion = false

    var body: some View {
        ZStack {
            if carga {
                SplashView()
                    .transition(.opacity)
            } else if sesion {
                HomeView()
                    .transition(.move(edge: .trailing))
            } else {
                ContentView {
                    // Acceso de demostración; todavía no hay autenticación.
                    withAnimation(.easeInOut(duration: 0.4)) {
                        sesion = true
                    }
                }
                .transition(.opacity)
            }
        }
        .task {
            guard carga else { return }

            do {
                try await Task.sleep(for: .seconds(1.5))
                try Task.checkCancellation()
            } catch {
                return
            }

            withAnimation(.easeOut(duration: 0.4)) {
                carga = false
            }
        }
    }
}

#Preview {
    RootView()
}
