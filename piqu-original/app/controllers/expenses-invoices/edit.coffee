import Ember from 'ember'
import BillingDocumentMixin from '../../mixins/billing-document-mixin'

export default Ember.ObjectController.extend BillingDocumentMixin,
  title: (->
    "Edit received invoice"
  ).property()

  actionName: (->
    "Update"
  ).property()

  afterSaveUrl: (->
    'expenses'
  ).property()
