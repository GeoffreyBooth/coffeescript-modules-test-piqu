import Ember from 'ember'
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'

export default Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    receivedTickets = @modelFor 'expenses-tickets'
    receivedTicketNumbers = receivedTickets.mapProperty('number').compact()
    receivedTicketNumbers.push(0)

    defaultNumber = Math.max.apply(
      null,
      receivedTicketNumbers
    ) + 1

    @store.createRecord 'ticket',
      number: defaultNumber
      kind: 'received'
      emittedAt: new Date()

  renderTemplate: ->
    @render 'tickets/form',
      controller: 'expenses-tickets/new'

  setupController: (controller, model) ->
    this._super(controller, model)

    model.get('items').then (items) =>
      if Ember.isEmpty items
        items.addObject(@store.createRecord 'item',
          quantity: 1
          vatPercentage: 21
          irpfPercentage: 0
        )
