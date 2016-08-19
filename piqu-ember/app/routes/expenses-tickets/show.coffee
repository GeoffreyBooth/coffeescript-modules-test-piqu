import Ember from 'ember'
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'

export default Ember.Route.extend AuthenticatedRouteMixin,
  model: (params) ->
    @store.find 'ticket', params.id

  renderTemplate: ->
    @render 'tickets/show'
