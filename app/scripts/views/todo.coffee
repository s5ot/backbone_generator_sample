'use strict';

class backboneGeneratorSample.Views.TodoView extends Backbone.View
    tagName: 'li'

    template: JST['app/scripts/templates/todo.ejs']

    events: {
        'dblclick span': 'toggleEdit'
        'submit form': 'toggleEdit'
        'blur .todo': 'blur'
        'keyup .todo': 'keyup'
        'click .glyphicon-remove-circle': 'destroy'
    }

    destroy: ->
        this.model.destroy()

    initialize: ->
        this.listenTo(this.model, 'change', this.render)
        this.listenTo(this.model, 'destroy', this.remove)

    render: ->
        this.$el.html(this.template(this.model.toJSON()))
        this.$el.addClass('edit')
        this.$input = this.$('.edit')
        return this

    blur: (e)->
       if this.$el.hasClass('editing')
           this.toggleEdit()

    keyup: (e)->
       if (e.which == 13)
           this.toggleEdit()

    toggleEdit: ->
       if this.$el.hasClass('edit')
           this.$el.removeClass('edit')
           this.$el.addClass('editing')
           this.$el.find('input').focus()
       else
           title = this.$el.find('.todo').val()
           if (title.length != 0)
               this.$el.find('span.title').text(title)
           this.$el.removeClass('editing')
           this.$el.addClass('edit')
