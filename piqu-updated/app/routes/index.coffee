import Ember from 'ember'

export default Ember.Route.extend(
  model: ->
    if @get 'session.isAuthenticated'
      @store.fetchById('balance', moment().year().toString())

  afterModel: (model) ->
    if @get 'session.isAuthenticated'
      user = @modelFor('application')
      user.get('account').then (account) =>
        unless account
          @transitionTo('configuration'))


