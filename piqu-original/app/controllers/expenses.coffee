import Ember from 'ember'

export default Ember.ObjectController.extend
  total: (->
    total = 0

    @get('invoices').forEach (invoice) ->
      total += invoice.get('total') * 100

    @get('tickets').forEach (ticket) ->
      total += ticket.get('total') * 100

    total / 100
  ).property('invoices.@each', 'tickets.@each')

  totalWithoutTaxes: (->
    total = 0

    @get('invoices').forEach (invoice) ->
      total += invoice.get('totalWithoutTaxes') * 100

    @get('tickets').forEach (ticket) ->
      total += ticket.get('totalWithoutTaxes') * 100

    total / 100
  ).property('invoices.@each', 'tickets.@each')

  vat: (->
    total = 0

    @get('invoices').forEach (invoice) ->
      total += invoice.get('vat') * 100

    @get('tickets').forEach (ticket) ->
      total += ticket.get('vat') * 100

    total / 100
  ).property('invoices.@each', 'tickets.@each')

  irpf: (->
    total = 0

    @get('invoices').forEach (invoice) ->
      total += invoice.get('irpf') * 100

    @get('tickets').forEach (ticket) ->
      total += ticket.get('irpf') * 100

    total / 100
  ).property('invoices.@each', 'tickets.@each')