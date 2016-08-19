import Ember from 'ember'
import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'

export default Ember.Route.extend ApplicationRouteMixin,
  model: ->
    if @get 'session.isAuthenticated'
      @store.find 'user', @get('session.access_token')
    else
      @store.createRecord 'registration'

  actions:
    createUser: ->
      credentials =
        username: @get 'currentModel.email'
        password: @get 'currentModel.password'

      @get('currentModel').save().then =>
        session = @get 'session'

        session.authenticate(
          'simple-auth-authenticator:oauth2-password-grant', {
            grant_type: 'password',
            identification: credentials.username,
            password: credentials.password
          }
        )

        @transitionTo 'configuration'

      , (errors) =>
        @set 'controller.errors', errors.errors

    sessionAuthenticationSucceeded: ->
      @_super()

      @refresh()

    destroyBillingDocument: (document) ->
      if confirm "Are you sure you want to destroy this document?"
        document.destroyRecord()

    viewPdf: (invoice) ->
      modal = Ember.$('#invoice-pdf-modal')
      pdfUrl = '/invoices/' + invoice.get('id') + '.pdf?access_token=' + @get('session.access_token')
      modal.find('object').attr('data', pdfUrl)
      modal.foundation('reveal', 'open')

    closePdf: ->
      Ember.$('#invoice-pdf-modal').foundation('reveal', 'close')
