import Ember from 'ember'

export default Ember.View.extend
  initFoundation: (->
    this.$(document).foundation()
 ).on('didInsertElement')