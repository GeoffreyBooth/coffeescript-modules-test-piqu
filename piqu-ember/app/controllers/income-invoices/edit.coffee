import Ember from 'ember'
import BillingDocumentMixin from '../../mixins/billing-document-mixin'

export default Ember.ObjectController.extend BillingDocumentMixin,
  title: (->
    "Edit emitted invoice"
  ).property()

  actionName: (->
    "Update"
  ).property()

  afterSaveUrl: (->
    'income'
  ).property()
