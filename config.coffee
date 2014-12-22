# See http://brunch.io/#documentation for docs.

exports.config =
  files:
    javascripts:
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^(client|vendor\/scripts)/

    stylesheets:
      joinTo: 'css/app.css'

      order:
        before: ['vendor/styles/bootstrap.min.css']

    templates:
      joinTo:
        '.compile-jade': /^app/

  modules:
    definition: false
    wrapper: false

  optimize: false

  overrides:
    minifier:
      sourceMaps: false

      plugins:
        pleeease:
          optimizers:
            minifier: true
            mqpacker: true

  paths:
    jadeCompileTrigger: '.compile-jade'

  plugins:
    gzip:
      paths:
        javascript: 'public/js'
        stylesheets: 'public/css'
        
    jade_angular:
      modules_folder: 'templates'
      locals: {}

    pleeease:
      fallbacks:
        autoprefixer: true
        rem: false
        variables: true

      optimizers:
        import: false
        minifier: false
        mqpacker: false

    uglify:
      mangle: false

      compress:
        global_defs:
          DEBUG: true

  sourceMaps: true
