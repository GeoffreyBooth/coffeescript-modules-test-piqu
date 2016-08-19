import Ember from 'ember'

export default Ember.ObjectController.extend
  year: (->
    moment().year()
  ).property()

  quarter: (->
  ).property()

  years: (->
    [2012, 2013, 2014, 2015]
  ).property()

  quarters: (->
    [null, '1T', '2T', '3T', '4T']
  ).property()

  fetchBalace: (->
    newId = @get('year').toString()

    if @get('quarter')
      newId += '-' + @get('quarter')

    @store.fetchById('balance', newId).then (balance) =>
      @set 'content', balance
  ).observes('quarter', 'year')
