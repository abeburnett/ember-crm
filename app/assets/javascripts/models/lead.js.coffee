App.Lead = DS.Model.extend
	firstName: DS.attr('string')
	lastName: DS.attr('string')
	email: DS.attr('string')
	phone: DS.attr('string')
	status: DS.attr('string', defaultValue: 'new')
	notes: DS.attr('string')

	fullName: ( -> 
		@get('firstName') + ' ' + @get('lastName')
		).property('firstName', 'lastName')

App.Lead.reopenClass
	STATUSES: ['new', 'in progress', 'closed', 'bad']

App.LeadRoute = Ember.Route.extend

	model: (params) -> @store.find 'lead', params.id

App.LeadController = Ember.ObjectController.extend
	
	actions:
		saveChanges: -> @get('model').save() if @get('model.isDirty')