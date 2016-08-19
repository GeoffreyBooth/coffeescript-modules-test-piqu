import DS from 'ember-data'

export default DS.Model.extend
  taxId:   DS.attr 'string'
  name:    DS.attr 'string'
  phone:   DS.attr 'string'
  address: DS.attr 'string'
  zipCode: DS.attr 'string'
  city:    DS.attr 'string'
  country: DS.attr 'string'
  kind:    DS.attr 'string'
