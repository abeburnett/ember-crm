App.LeadEditController = Ember.ObjectController.extend

	actions:

		saveChanges: ->
			@get('model').save().then =>
				@transitionToRoute 'lead'

		cancel: ->
			@get('model').rollback()
			@transitionToRoute 'lead'

App.LeadEditRoute = Ember.Route.extend
	
	activate: -> @controllerFor('lead').set 'isEditing', true
	deactivate: -> @controllerFor('lead').set 'isEditing', false