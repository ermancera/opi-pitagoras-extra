# See http://brunch.io/#documentation for docs.

exports.config =
  modules:
    definition: false
    wrapper: false

  paths:
    jadeCompileTrigger: '.compile-jade'

  files:
    javascripts:
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^(bower_components|vendor)/

    stylesheets:
      joinTo:
        'css/app.css': /^(app|bower_components|vendor)/

    templates:
      joinTo:
        '.compile-jade': /^app/

  plugins:
    autoprefixer:
      cascade: false

    jade_angular:
      modules_folder: 'templates'
      locals: {}

    stylus:
      plugins: ['autoprefixer-stylus']
