import Ember from 'ember'
import BillingDocumentMixin from '../../mixins/billing-document-mixin'

export default Ember.ObjectController.extend BillingDocumentMixin,
  title: (->
    "Edit emitted ticket"
  ).property()

  actionName: (->
    "Update"
  ).property()

  afterSaveUrl: (->
    'income'
  ).property()
