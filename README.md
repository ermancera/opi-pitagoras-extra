# OPIbank
## Examen de @opi_global para @bkuri.

Utiliza Coffeescript, AngularJS, Jade y Stylus.

    Para el examen es importante tener en cuenta las siguientes consideraciones:
     - Deberías de utilizar Angular para realizarlo.
     - No es necesario realizar conexiones con servidores, cualquier uso de base de datos puedes hacerlo del lado del cliente usando local storage.
     - No hace falta crear un login.
     - Se va a calificar la limpeza del código.

    El examen consta de lo siguiente:
     - Se cuenta con dos cuentas bancarias con cantidades c1 y c2 de dinero inicialmente.
     - El usuario puede sacar dinero de una cuenta, durante el paso debe de quedar en otro objeto llamado "bolsa".
     - El usuario puede poner dinero en una cuenta, durante el paso debe de quedar en el objeto "bolsa" (pero negativo).
     - El usuario puede distribuir el monto de "bolsa" en las cuentas.
     - El usuario puede crear una nueva cuenta con el monto de la bolsa (total o parcial).
     - El usuario da guardar a los cambios cuando el objeto "bolsa" está en cero.
     - Todos los pasos (luego del commit) pueden ser consultados en un historial de cambios.

    OPCIONAL: Se da puntos adicionales si utilizas un gráfico de d3.js


## Instalación

### Node.js

Instalar [Node.js](http://nodejs.org).  Visita http://nodejs.org/download/ y descarga la versión para tu sistema operativo.
Una vez que `node` y `npm` estén disponibles instala los paquetes:

 `$ npm install`

Esta operación creará un subdirectorio llamado `node_modules` e instalará los paquetes dentro de este.

### Brunch

Puedes instalar Brunch globalmente usando:

 `# npm install -g brunch`

Instala Bower globalmente e instala sus componentes usando:

 ```
 # npm install -g bower
 $ bower install
 ```

Nota: Para que el último comando funcione, se necesita que git esté disponible en tu $PATH, así es que en Windows se recomienda invocarlo
dentro de un REPL de git.


`bower install` creará el subdirectorio `bower_components` y
descargará los componentes de AngularJS, Bootstrap y jQuery, los cuales están especificados dentro del archivo `bower.json`.


### Iniciar la aplicación

Utilizar el siguiente comando:

`npm start`


## Gracias!
