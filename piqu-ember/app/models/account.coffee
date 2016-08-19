import DS from 'ember-data'

export default DS.Model.extend
  name:    DS.attr 'string'
  taxId:   DS.attr 'string'
  phone:   DS.attr 'string'
  address: DS.attr 'string'
  zipCode: DS.attr 'string'
  city:    DS.attr 'string'
  country: DS.attr 'string'

  user:    DS.belongsTo 'user', { async: true }
