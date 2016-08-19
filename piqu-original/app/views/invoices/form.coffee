import Ember from 'ember'

export default Ember.View.extend
  setSelectedCompany: (->
    Ember.run.scheduleOnce 'afterRender', this, =>
      companyId = @get 'controller.model.relatedCompany.id'
      $('select#related-company option[value="' + companyId + '"]').prop('selected', true)
  ).on('didInsertElement').observes('controller.relatedCompanies.@each')
