import Ember from 'ember'
import config from './config/environment'

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'configuration'
  @route 'login'
  @resource 'income', ->
  @resource 'income-invoices', { path: 'income/invoices' }, ->
    @route 'new'
    @route 'show', { path: ':id' }
    @route 'edit', { path: ':id/edit' }
  @resource 'income-tickets', { path: 'income/tickets' }, ->
    @route 'new'
    @route 'show', { path: ':id' }
    @route 'edit', { path: ':id/edit' }
  @resource 'expenses', ->
  @resource 'expenses-invoices', { path: 'expenses/invoices' }, ->
    @route 'new'
    @route 'show', { path: ':id' }
    @route 'edit', { path: ':id/edit' }
  @resource 'expenses-tickets', { path: 'expenses/tickets' }, ->
    @route 'new'
    @route 'show', { path: ':id' }
    @route 'edit', { path: ':id/edit' }

export default Router
