import BillingDocument from './billing-document.js'

export default BillingDocument.extend
  number:     DS.attr 'number'
  kind:       DS.attr 'string'
  state:      DS.attr 'string'
  emittedAt:  DS.attr 'date'
  paidAt:     DS.attr 'date'

  relatedCompany: DS.belongsTo 'relatedCompany',
    inverse: null
    async:   true
