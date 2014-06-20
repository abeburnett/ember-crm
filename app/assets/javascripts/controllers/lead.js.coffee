App.LeadController = Ember.ObjectController.extend

	isEditing: false

	showUnsavedMessage: ( ->
		@get('isDirty') and !@get('isSaving')
	).property('isDirty', 'isSaving')

	actions:

		delete: ->
			@get('model').destroyRecord().then =>
				@transitionToRoute 'leads'

		saveChanges: -> @get('model').save()