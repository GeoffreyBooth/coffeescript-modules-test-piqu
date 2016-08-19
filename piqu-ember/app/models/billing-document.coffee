import DS from 'ember-data'

export default DS.Model.extend
  items: DS.hasMany 'items',
    async: true
    inverse: 'billingDocument'
  total: DS.attr 'number'
  totalWithoutTaxes: DS.attr 'number'
  vat: DS.attr 'number'
  irpf: DS.attr 'number'

  dateOutputFormat: (->
    "L"
  ).property()