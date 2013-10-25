'use strict';

class backboneGeneratorSample.Views.TodoView extends Backbone.View
    tagName: 'li'
    template: JST['app/scripts/templates/todo.ejs']
    events: {
        'click input[type="checkbox"]': 'toggle'
        'dblclick span': 'toggleEdit'
        'submit form': 'toggleEdit'
    }
    initialize: ->
    render: ->
    toggle: ->
    toggleEdit: ->
