import Ember from 'ember'
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'

export default Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    currentUser = @modelFor('application')
    currentUser.get('account').then (account) =>
      if !account
        @store.createRecord 'account',
          user: currentUser
      else
        account

  actions:
    commit: ->
      @get('currentModel').save().then =>
        @transitionTo 'application'
      , ->

    willTransition: (transition) ->
      if @get 'currentModel.isNew'
        this.container.lookup('view:toplevel').rerender()
        transition.abort()
      else
        return true
