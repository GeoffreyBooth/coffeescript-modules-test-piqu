import Ember from 'ember'
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'

export default Ember.Route.extend AuthenticatedRouteMixin,
  model: (params) ->
    @store.find 'ticket', params.id

  renderTemplate: ->
    @render 'tickets/form',
      controller: 'expenses-tickets/edit'

  setupController: (controller, model) ->
    this._super(controller, model)

    model.get('items').then (items) =>
      if Ember.isEmpty items
        items.addObject(@store.createRecord 'item',
          quantity: 1
          vatPercentage: 21
          irpfPercentage: 0
        )
