window.backboneGeneratorSample =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'
    console.log 'Hello from Backbone!!'
    new this.Views.TodosView {
        collection: new this.Collections.TodosCollection()
    }

$ ->
  'use strict'
  backboneGeneratorSample.init();
