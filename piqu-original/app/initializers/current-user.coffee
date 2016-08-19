import Ember from 'ember'
import Session from 'simple-auth/session'

export default {
  name: 'current-user'
  before: 'simple-auth'

  initialize: (container) ->
    Session.reopen
      setCurrentUser: (->
        token = @get 'content.access_token'

        store = container.lookup('store:main')

        unless Ember.isEmpty token
          store.find('user', token).then (user) =>
            @set 'currentUser', user
      ).observes('access_token')
}
