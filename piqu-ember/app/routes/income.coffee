import Ember from 'ember'
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'

export default Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    tickets  = @store.find 'ticket', { kind: 'emitted' }
    invoices = @store.find 'invoice', { kind: 'emitted' }

    return Ember.RSVP.hash {
      tickets: tickets
      invoices: invoices
    }

