# suscription_manager_app

Subscription Manager App

# Arquitectura
El Proyecto implementa la Clean Architecture dividida en tres capas principales
- Presentación
   - Interfaces de Usuario (Widgets)
   - Gestión de estado con Riverpod
   - Manejo de Eventos y navegación
- Dominio
   - Modelos de negocio (Entities)
   - Casos de uso
   - Patrón repositorio (interfaces de repositorios)
- Datos
   - Implementación de los repositorios
   - Fuentes de datos (API simulada con un json)
   - Archivos Source
- Remote   
   - Implementación de los Source (manejo de respuestas de la API)

# Estructura del Proyecto

# Como Correr la APP

# Requisitos Previos
- Flutter 3.19.0 o superior
- Dart 3.3.0 o superior
- Git

# Pasos de instalación

1. Clonar el repositorio
   a. Git clone https://github.com/Rai1502/PracticaSuscripciones.git
2. Instalar las dependencias
   a. Flutter pub get
   b. flutter pub run build_runner build --delete-conflicting-outputs (en caso que marque algun error)
3. Correr la aplicación
   a. Flutter run o con F5 desde vscode

# Configuración Adicional
La aplicación utiliza datos simulados (mock) para las respuestas de API asi que no se requiere ninguna configuración de backend.

# Decisiones Técnicas
# Gestión de Estado

Elegí riverpod porque nos ofrece un manejo de estado predecible y una integración natural con widgets.
Además el state lo cree con freezed porque esto nos ayuda a mantener una inmutabilidad en las variables del estado evitando algún error por basura en tiempo de ejecución.

# Arquitectura y Patrones
- Clean Architecture porque facilita el mantenimiento y el testing del código.
- Repository Pattern Nos permite la abstracción de la fuente de datos permitiéndonos cambiar ente api real y una simulada (es una de las mejorar que se podrían hacer a futuro)
- Inyección de Dependencias implementada con riverpod para mejorar la testeabilidad de nuestra app.

UI/UX
- Widgets personalizados, cree componentes custom o reutilizables, esto nos ayudara a no repetir código durante la app y que estos widgets puedan ser adaptables en cualquier pantalla, un ejemplo puede ser nuestro MainButton.
- Animaciones, se integraron animaciones suaves para las transiciones entre pantallas
- Manejo de errores, se implementó un feedback visual para errores de usuario.

# Futuras Mejoras (posibles)

Autenticación
- Implementación de un login real usando la autenticación de Firebase Auth (cuenta con distintas opciones de autenticación)
- Gestion de sesiones persistentes a partir de un token
- Recuperación de contraseñas
- Registro de nuevos usuarios.

Integración con Firebase
- Base de datos en tiempo real
- Analytics para seguimiento del uso de la app
- Crashlytics para el monitoreo de posibles errores
- Notificaciones push para recordatorio de pagos

Integración de Stripe SDK
- SDK completo de Stripe para pagos
- Procesamiento real de tarjetas
- Token para la seguridad de datos
- Webhooks para eventos de pago (pago exitoso, tarjeta rechazada, suscripción por vencer).
- Manejo de suscripciones recurentes y se haga pago en automatico en la fecha establecidad

# Otras mejoras
- Pantalla con el historial de pagos de la subscripción
- Aplicación de tema obscuro/Claro
- Autenticacion con biometria (ios: FaceID, android: huella dactilar)

# Link del portafolio
[Repositorio del Proyecto](https://github.com/Rai1502/PracticaSuscripciones)
link hacia el repositorio en github, de igual forma durante el mail enviado se ha incluido la carpeta del proyecto en un archivo .zip.
