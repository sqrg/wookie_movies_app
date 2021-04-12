# Wookie Movies

A movie listing app created for a technical test

Se utiliza **Stacked** como paquete de arquitectura. El mismo nos permite de manera muy simple aplicar el patrón MVVM a una aplicación de Flutter.

Gracias a esto podemos separar la lógica de la presentación, tener un código limpio y mantenible en el tiempo.

## Extra features

### Tema claro y oscuro

Usando el **ThemeManager** provisto por Stacked, podemos cambiar el tema de la aplicación desde el menú lateral sin necesidad de reiniciar la aplicación.

### Persistencia de datos

El paquete **Moor** nos permite crear un modelo de datos y guardarlo en base de datos. Y también nos da acceso a funciones de query simples sin tener que implementarlas directamente con sqflite.

El setup se puede ver en `lib/core/data/moor_database.dart`

### Chequeos de conectividad

La persistencia de datos no sería muy útil si no tenemos una manera de saber si estamos conectados o no. Se hace uso de una función muy simple para tal caso.