import Ember from 'ember'
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'

export default Ember.Route.extend AuthenticatedRouteMixin,
  model: (params) ->
    @store.find('invoice', params.id)

  renderTemplate: ->
    @render 'invoices/form',
      controller: 'expenses-invoices/edit'

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
