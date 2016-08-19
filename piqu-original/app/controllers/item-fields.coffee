import Ember from 'ember'

export default Ember.ObjectController.extend
  actions:
    destroy: (item) ->
      item.destroyRecord()
      return false