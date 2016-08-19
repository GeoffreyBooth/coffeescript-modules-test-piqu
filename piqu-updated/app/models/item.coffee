import DS from 'ember-data'

export default DS.Model.extend
  concept:           DS.attr 'string'
  unitPrice:         DS.attr 'number'
  quantity:          DS.attr 'number',
    defaultValue: 1
  vatPercentage:     DS.attr 'number'
  irpfPercentage:    DS.attr 'number'
  vat:               DS.attr 'number'
  irpf:              DS.attr 'number'
  totalWithoutTaxes: DS.attr 'number'
  total:             DS.attr 'number'

  billingDocument:   DS.belongsTo 'billingDocument',
    async:       true
    polymorphic: true
    inverse:     'items'