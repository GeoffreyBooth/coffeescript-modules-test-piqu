import Ember from 'ember'
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'

export default Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    emittedTickets = @modelFor 'income-tickets'
    emittedTicketNumbers = emittedTickets.mapProperty('number').compact()
    emittedTicketNumbers.push(0)

    defaultNumber = Math.max.apply(
      null,
      emittedTicketNumbers
    ) + 1

    @store.createRecord 'ticket',
      number: defaultNumber
      kind: 'emitted'
      emittedAt: new Date()

  renderTemplate: ->
    @render 'tickets/form',
      controller: 'income-tickets/new'

  setupController: (controller, model) ->
    this._super(controller, model)

    model.get('items').then (items) =>
      if Ember.isEmpty items
        items.addObject(@store.createRecord 'item',
          quantity: 1
          vatPercentage: 21
          irpfPercentage: 0
        )
