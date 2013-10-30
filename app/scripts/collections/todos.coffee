'use strict';

class backboneGeneratorSample.Collections.TodosCollection extends Backbone.Collection

  model: backboneGeneratorSample.Models.TodoModel

  localStorage: new Backbone.LocalStorage('backbone-generator-todos')

  initialize: ->
    console.log 'TodosCollection initialized'
