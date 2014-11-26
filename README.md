# pitagoras-extras
## Elementos UI para Pitágoras

Utiliza Coffeescript, AngularJS, Jade y Stylus.

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
