# pitagoras-extra
## UI para Pitágoras v2
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

Nota: Para que el último comando funcione se necesita que git esté disponible en tu $PATH, así es que en Windows se recomienda invocarlo dentro de un REPL de git.

`bower install` creará el subdirectorio `bower_components` y
descargará los componentes relacionados con AngularJS, Bootstrap, etc (especificados dentro de `bower.json`).


## Uso del servidor
### Arrancar el servidor local
Utilizar el siguiente comando:

`npm start`

Ahora abre un navegador y diríjelo a [http://localhost:3333/]()

### Localización de archivos
Todos los archivos relacionados con tu app se encuentran en el subdirectorio `app/`. El archivo `app/index.jade` es el principal. El directorio `app/assets` incluye archivos que NO serán optimizados, pero que sí son importantes, tales como fonts, imágenes, etc. El directorio `app/partials` incluye parciales que serán optimizados junto con el archivo principal. La carpeta `app/scripts` contiene todo el javascript relacionado con la aplicación; todos estos archivos se optimizan automáticamente al momento de editarlos. Por último, el subdirectorio `app/styles` incluye todo el CSS relacionado con el app.

### Optimización automática
Todos los archivos mencionados anteriormente serán optimizados al momento de ser editados (mientras el servidor esté activado). Las optimizaciones inclyen concatenación, minificación y, en el caso de CSS, autoprefixing.
