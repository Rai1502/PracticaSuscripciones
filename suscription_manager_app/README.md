# suscription_manager_app



### Capas de la Arquitectura:
- *Data*: Implementación de repositorios y fuentes de datos
- *Domain*: Casos de uso y entidades del negocio
- *Presentation*: UI y gestión de estado con Riverpod

## Cómo Ejecutar la Aplicación

1. Requisitos previos:
   - Flutter SDK (versión X.X.X)
   - Dart SDK (versión X.X.X)

2. Clonar el repositorio:
   ```bash
   git clone https://github.com/tu-usuario/subscription-manager-app.git
   ```

3. Instalar dependencias:
   ```bash
   flutter pub get
   ```

4. Ejecutar la aplicación:
   ```bash
   flutter run
   ```

## Decisiones Técnicas

### Gestión de Estado
- **Riverpod**: He decidido usar riverpod encima de Provider por las siguientes razones:
    - Mejor tipado y seguridad en tiempo de compilación
    - Más fácil de testear
    - Mejor manejo de dependencias
    - Más moderno y con mejor soporte a futuro

### Arquitectura
- **Clean Architecture**: Permite separación de responsabilidades y código mantenible
- **SOLID Principles**: Aplicados para mejor escalabilidad y mantenibilidad

### Testing
- Tests unitarios para lógica de negocio
- Widget tests para componentes de UI

### UI/UX
- Material Design 3
- Animaciones personalizadas para transiciones
- Manejo de estados de carga y errores

## Posibilidades de Mejora Futura

1. **Integración con Backend Real**
   - Implementación de API REST
   - Integración con Firebase Authentication

2. **Pagos**
   - Integración completa con Stripe SDK
   - Manejo de suscripciones recurrentes

3. **Características Adicionales**
   - Notificaciones push
   - Sincronización offline

## Enlaces

- [Portafolio](tu-enlace-aqui)
- [Documentación Técnica](tu-enlace-aqui)


