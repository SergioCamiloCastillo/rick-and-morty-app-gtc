# Rick and Morty App GTC

## Descripción

Una aplicación Flutter que muestra información sobre personajes de Rick and Morty. Utiliza la [API de Rick and Morty](https://rickandmortyapi.com/documentation/) para recuperar datos sobre los personajes.

## Características

| Funcionalidad               | Descripción                                     |
|-----------------------------|-------------------------------------------------|
| Lista de personajes         | Muestra información detallada de los personajes.|
| Detalles del personaje      | Proporciona detalles al hacer clic en la lista. |
| Paginación                  | Scroll infinito para cargar más personajes de forma paginada.|
| Búsqueda de personajes      | Busca personajes por nombre.   

## Capturas de pantalla
![Captura de pantalla 2024-02-04 a la(s) 11 52 46 p  m](https://github.com/SergioCamiloCastillo/rick-and-morty-app-gtc/assets/26844982/5ae022b1-79f5-456d-8d51-27dd7c6341ab)
![Captura de pantalla 2024-02-04 a la(s) 11 54 26 p  m](https://github.com/SergioCamiloCastillo/rick-and-morty-app-gtc/assets/26844982/cd8cf7c4-f82e-48ff-bdf5-d2a1ee7a79d8)
![Captura de pantalla 2024-02-04 a la(s) 11 53 54 p  m](https://github.com/SergioCamiloCastillo/rick-and-morty-app-gtc/assets/26844982/903d791c-2321-4a2f-b506-b8657a45f15a)


## Requisitos Previos ##

Asegúrate de tener instalados los siguientes requisitos previos antes de comenzar:

* Flutter SDK
* Git

## Instalación

1. **Clone el repositorio:**

   ```bash
   git clone https://github.com/tu-usuario/rick_and_morty_app_gtc.git
2. **Ingrese al directorio del proyecto:**
   ```bash
   cd rick_and_morty_app_gtc
3. **Instale las dependencias:**
   ```bash
   flutter pub get
4. **Ejecute la aplicación:**
   ```bash
   flutter run

## Herramientas utilizadas

| Herramientas         | Descripción                                                                                                                                                      | Enlace                                         |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------|
| Flutter             | Framework de código abierto para desarrollar aplicaciones nativas para móviles, web y escritorio desde una única base de código.                                    | [Flutter](https://flutter.dev/)               |
| animate_do          | Librería que proporciona animaciones atractivas y fáciles de usar para aplicaciones Flutter.                                                                    | [animate_do](https://pub.dev/packages/animate_do) |
| dio                 | Cliente HTTP para Dart que admite solicitudes RESTful, intercepciones, transformaciones de datos, carga y descarga de archivos, etc.                               | [dio](https://pub.dev/packages/dio)            |
| flutter_riverpod    | Proveedor de estado para Flutter fácil de usar, conciso y completamente compatible con el árbol de widgets de Flutter.                                          | [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) |
| go_router           | Enrutador de navegación simple pero poderoso para Flutter que facilita la navegación y la gestión de rutas en la aplicación.                                      | [go_router](https://pub.dev/packages/go_router) |
| skeletonizer        | Librería que permite crear esqueletos de carga (skeletons) para indicar visualmente la carga de contenido en una aplicación.                                     | [skeletonizer](https://pub.dev/packages/skeletonizer) |
| flutter_test        | Biblioteca de pruebas para Flutter que proporciona herramientas y utilidades para escribir y ejecutar pruebas unitarias y de integración.                          | [flutter_test](https://flutter.dev/docs/testing) |
| flutter_lints       | Conjunto de reglas de análisis estático para Dart y Flutter que ayuda a mantener un código limpio y consistente.                                                 | [flutter_lints](https://pub.dev/packages/flutter_lints) |

## Arquitectura implementada

En este proyecto, se siguen los principios de arquitectura limpia al organizar las carpetas y los diferentes componentes del sistema. La capa de dominio define las reglas de negocio y las abstracciones esenciales de la aplicación, se encuentran las definiciones de las entidades, los repositorios y las fuentes de datos; En la capa de infraestructura, se gestionan las tareas relacionadas con la manipulación de datos y la comunicación con recursos externos; y por ultimo, en la capa de presentación, se ocupan de la interfaz de usuario y la interacción del usuario

## Flujo de Trabajo (Clean Architecture) ##
El flujo de trabajo sigue un patrón claro para garantizar la separación de preocupaciones y mantener un código limpio y mantenible. Aquí se detalla el proceso:

**1. Interacción en la Capa de Presentación:**
  * El usuario interactúa con la interfaz de usuario en la capa de presentación.
  * El controlador en la capa de presentación captura las acciones del usuario y las procesa.

**2. Inicio de Solicitud desde el Controlador:**
  * El controlador inicia una solicitud basada en las acciones del usuario.

**3. Viaje a través de los Casos de Uso:**
  * La solicitud viaja a través de los casos de uso que contienen la lógica de negocio asociada.
  * Los casos de uso coordinan y orquestan la ejecución de la lógica de negocio específica para la solicitud.

**4. Acceso a Datos a través de Repositorios:**
  * Los casos de uso acceden a los datos necesarios a través de repositorios.
  * Los repositorios actúan como una capa intermedia que interactúa con los datasources.

**5. Comunicación con Datasources:**
  * Los repositorios se comunican con datasources, que pueden ser bases de datos, servicios web o almacenamiento local.
  * Los datasources recuperan, modifican o almacenan datos según sea necesario.

**6. Procesamiento de Datos:**
  * Los datos obtenidos de los datasources se procesan según las necesidades de la lógica de negocio.

**7. Devolución a la Capa de Presentación:**
  * Los datos procesados se devuelven a la capa de presentación a través de los casos de uso.

**8. Independencia de Datos de la Capa de Presentación:**
  * La separación de la capa de presentación y los datos garantiza que la lógica de negocio y los datos se mantengan independientes.
  * Esto facilita el mantenimiento y mejora la legibilidad del código.

Este flujo de trabajo asegura una clara separación de responsabilidades y promueve buenas prácticas de arquitectura de software en el desarrollo del proyecto.
