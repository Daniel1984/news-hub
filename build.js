({
    optimizeAllPluginResources: true,
    baseUrl: "public/javascripts",
    paths: {
        jquery: "../../app/assets/javascripts/lib/jquery",
        underscore: "../../app/assets/javascripts/lib/underscore",
        backbone: "../../app/assets/javascripts/lib/backbone",
        text: "../../app/assets/javascripts/lib/require/text",
        domready: "../../app/assets/javascripts/lib/require/domready",
        spinner: "../../app/assets/javascripts/lib/spiner",
        bootstrap: "../../app/assets/javascripts/lib/bootstrap",
        templates: "../../app/assets/javascripts/templates"
    },
    shim: {
      underscore: {
        exports: '_'
      },
      backbone: {
        deps: ["underscore", "jquery"],
        exports: "Backbone"
      },
      spin: {
        exports: "Spinner"
      },
      bootstrap: {
        deps: ['jquery']
      }
    },
    name: "main",
    out: "public/javascripts/main-built.js",
    optimize: "none"
})