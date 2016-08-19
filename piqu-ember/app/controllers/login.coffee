import Ember from 'ember'
import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin'

export default Ember.Controller.extend(LoginControllerMixin, {
  authenticator: 'simple-auth-authenticator:oauth2-password-grant'

  actions:
    authenticate: ->
      @_super().then null, =>
        @set 'loginFailed', true
})
