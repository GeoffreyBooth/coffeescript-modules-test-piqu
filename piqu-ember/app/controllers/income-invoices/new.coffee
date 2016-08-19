import Ember from 'ember'
import BillingDocumentMixin from '../../mixins/billing-document-mixin'

export default Ember.ObjectController.extend BillingDocumentMixin,
  title: (->
    "Create new emitted invoice"
  ).property()

  actionName: (->
    "Create"
  ).property()

  afterSaveUrl: (->
    'income'
  ).property()
