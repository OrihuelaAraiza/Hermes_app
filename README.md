# Hermes_App

App de iOS con SwiftUI que reúne las pantallas de las ramas `HomeView`, `LoginView` y `SplashView`.

Abre `Hermes_App.xcodeproj` en Xcode, selecciona un simulador de iPhone o iPad y presiona **⌘R**.

## Pantallas

- `Hermes_App/ContentView.swift`: boceto de inicio de sesión y registro; es la pantalla inicial.
- `Hermes_App/HomeView.swift`: pantalla de tareas con datos de ejemplo. Sus modelos y componentes están en `HomeViewModel.swift`.
- `Hermes_App/SplashView.swift`: pantalla de bienvenida animada.

Las tres pantallas tienen un `#Preview` para verlas en Xcode. Los archivos Swift están dentro de `Hermes_App/`, la carpeta que el proyecto incluye automáticamente, y sus imágenes y colores están en `Hermes_App/Assets.xcassets/`.

## Estado actual

Las pantallas todavía no tienen navegación entre sí. El botón «Continuar» imprime un mensaje en la consola; no hay autenticación ni persistencia. Las tareas usan datos de ejemplo y su selección se mantiene solo en el estado local de cada fila.

## Compilación

Requiere Xcode con el SDK de iOS 27. Para comprobar la compilación para simulador:

```sh
xcodebuild -project Hermes_App.xcodeproj -scheme Hermes_App \
  -configuration Debug -sdk iphonesimulator \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath /tmp/Hermes_App-DerivedData \
  CODE_SIGNING_ALLOWED=NO build
```
