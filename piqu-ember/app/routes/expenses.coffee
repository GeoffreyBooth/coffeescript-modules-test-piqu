import Ember from 'ember'
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'

export default Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    tickets  = @store.find 'ticket', { kind: 'received' }
    invoices = @store.find 'invoice', { kind: 'received' }

    return Ember.RSVP.hash {
      tickets: tickets
      invoices: invoices
    }
