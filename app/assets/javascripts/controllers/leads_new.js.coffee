App.LeadsNewController = Ember.Controller.extend

	actions:

		createLead: ->
			fields = @get('fields')
			if App.Lead.valid(fields)
				lead = @store.createRecord 'lead', @get('fields')
				lead.save().then =>
					@transitionToRoute 'lead', lead
			else
				@set 'showError', true