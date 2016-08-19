import Ember from 'ember'

export default Ember.Mixin.create
  resetRelatedCompanyError: (->
    Ember.run.scheduleOnce 'afterRender', this, ->
      $('#related-company').on 'change', =>
        @set 'relatedCompanyMissing', false
  ).on('init')

  saveItems: ->
    document = @get 'model'

    itemPromises = Ember.A()
    @get('items').forEach (item) =>
      document.get('items').addObject item
      itemPromises.push item.save()

    Ember.RSVP.all(itemPromises).then =>
      url = @get 'afterSaveUrl'
      @transitionToRoute url
    , ->

  saveDocument: ->
    if @get 'model.isDirty'
      @get('model').save().then =>
        @saveItems()
      , ->
    else
      @saveItems()

  createOrAssociateRelatedCompany: ->
    return new Ember.RSVP.Promise (resolve, reject) =>
      if @get('newRelatedCompany')
        if @get('newCompany.isDirty')
          @get('newCompany').save().then (company) =>
            @set 'model.relatedCompany', company
            resolve()
          , ->
            reject()
        else
          resolve()
      else
        companyId = $('#related-company').val()

        unless companyId
          @set 'relatedCompanyMissing', true
          reject()
          return

        unless @get('newCompany.isDeleted')
          @get('newCompany').deleteRecord()

        @store.find('relatedCompany', companyId).then (company) =>
          @set 'model.relatedCompany', company
          resolve()

  actions:
    createBillingDocument: ->
      if @get('model.constructor.typeKey') == 'invoice'
        @createOrAssociateRelatedCompany().then =>
          @saveDocument()
      else
        @saveDocument()


    addItem: ->
      @get('items').addObject @store.createRecord('item',
        quantity: 1
        vatPercentage: 21
        irpfPercentage: 0
      )

    newRelatedCompany: ->
      $('#related-company').prop('disabled', true)
      $('#new-company-button').prop('disabled', true)
      @set('newRelatedCompany', true)
      @set('relatedCompanyMissing', false)
      $('#new-company').removeClass('hide')
      $('#select-company').addClass('hide')

    cancelNewCompany: ->
      $('#related-company').prop('disabled', false)
      $('#new-company-button').prop('disabled', false)
      @set('newRelatedCompany', false)
      $('#new-company').addClass('hide')
      $('#select-company').removeClass('hide')

