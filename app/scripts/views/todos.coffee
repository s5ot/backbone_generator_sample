'use strict';

class backboneGeneratorSample.Views.TodosView extends Backbone.View
    el: '#todos-app'

    template: JST['app/scripts/templates/todos.ejs']

    events: {
        'submit': 'createTodo'
    }

    initialize: ->
        console.log 'TodosView initialized'
        this.listenTo(this.collection, 'reset', this.addAllToDoItems)
        this.listenTo(this.collection, 'add', this.addTodoItem)
        this.render()
        this.collection.fetch({reset: true})

    render: ->
        this.$el.html this.template

    createTodo: (e)->
        if ($(e.target).attr('class') != 'input-append')
           console.log('not input-append')
           return false

        e.preventDefault()
        this.collection.create({'title': $('#new-todo').val()})

    addTodoItem: (todo)->
        todoView = new backboneGeneratorSample.Views.TodoView ({model: todo})
        console.log this.$('.todo-list')
        this.$('.todo-list').append(todoView.render().el)

    addAllToDoItems: ->
        console.log 'addAllToDoItems'
        this.$('.todo-list').html('')
        this.collection.each(this.addTodoItem, this)
