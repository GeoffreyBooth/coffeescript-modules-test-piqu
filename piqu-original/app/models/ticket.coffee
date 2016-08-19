import BillingDocument from './billing-document.js'

export default BillingDocument.extend
  number:             DS.attr 'number'
  kind:               DS.attr 'string'
  state:              DS.attr 'string'
  emittedAt:          DS.attr 'date'
  paidAt:             DS.attr 'date'
  relatedCompanyName: DS.attr 'string'
