# Hermes_App

App de iOS con SwiftUI que reúne las pantallas de las ramas `HomeView`, `LoginView` y `SplashView`, conectadas mediante la integración de `Rootview`.

Abre `Hermes_App.xcodeproj` en Xcode, selecciona un simulador de iPhone o iPad y presiona **⌘R**.

## Pantallas

- `Hermes_App/RootView.swift`: coordina el flujo Splash → acceso → Home.
- `Hermes_App/ContentView.swift`: boceto de inicio de sesión y registro; «Continuar» abre Home.
- `Hermes_App/HomeView.swift`: pantalla de tareas con datos de ejemplo. Sus modelos y componentes están en `HomeViewModel.swift`.
- `Hermes_App/SplashView.swift`: pantalla de bienvenida animada.

Las vistas tienen un `#Preview` para verlas en Xcode. Los archivos Swift están dentro de `Hermes_App/`, la carpeta que el proyecto incluye automáticamente, y sus imágenes y colores están en `Hermes_App/Assets.xcassets/`. `Hermes_AppApp` conserva el único punto de entrada de la aplicación. La integración reutiliza los nombres actuales de colores y la imagen `papuDibujo`, sin duplicar las pantallas de la raíz de la rama original.

## Estado actual

La app muestra Splash durante aproximadamente 1.5 segundos, después el acceso y, al pulsar «Continuar», Home. El acceso es una demostración: no valida credenciales, no crea cuentas y no hay autenticación ni persistencia.

Las tareas usan datos de ejemplo. Al marcar una tarea, se oculta con una animación después de 2 segundos y aumenta el porcentaje de progreso. Puede desmarcarse durante esa espera para cancelar la acción. Las tareas y el progreso se reinician al volver a abrir la app.

## Compilación

Requiere Xcode con el SDK de iOS 27. Para comprobar la compilación para simulador:

```sh
xcodebuild -project Hermes_App.xcodeproj -scheme Hermes_App \
  -configuration Debug -sdk iphonesimulator \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath /tmp/Hermes_App-DerivedData \
  CODE_SIGNING_ALLOWED=NO build
```
