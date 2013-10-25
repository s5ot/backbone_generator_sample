'use strict';

class backboneGeneratorSample.Views.TodosView extends Backbone.View
    el: '#todos-app'
    template: JST['app/scripts/templates/todos.ejs']
    events: {
        'submit': 'createTodo'
    }
    initialize: ->
        console.log 'TodosView initialized'
        this.render()
    render: ->
        this.$el.html this.template
    createTodo: (e)->
        console.log 'createTodo called'
        e.preventDefault()
    addTodoItem: ->
    addAllToDoItems: ->
