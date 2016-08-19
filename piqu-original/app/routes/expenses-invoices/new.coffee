import Ember from 'ember'
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'

export default Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    receivedInvoices = @modelFor 'expenses-invoices'
    receivedInvoiceNumbers = receivedInvoices.mapProperty('number').compact()
    receivedInvoiceNumbers.push(0)

    defaultNumber = Math.max.apply(
      null,
      receivedInvoiceNumbers
    ) + 1

    @store.createRecord 'invoice',
      number: defaultNumber
      kind: 'received'
      emittedAt: new Date()

  renderTemplate: ->
    @render 'invoices/form',
      controller: 'expenses-invoices/new'

  setupController: (controller, model) ->
    this._super(controller, model)

    controller.set 'newCompany', @store.createRecord('relatedCompany')

    @store.find('relatedCompany').then (companies) =>
      controller.set 'relatedCompanies', companies

    model.get('items').then (items) =>
      if Ember.isEmpty items
        items.addObject(@store.createRecord 'item',
          quantity: 1
          vatPercentage: 21
          irpfPercentage: 0
        )

  actions:
    willTransition: ->
      if @get('controller.newCompany.isNew')
        @get('controller.newCompany').deleteRecord()
