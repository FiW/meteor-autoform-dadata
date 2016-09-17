Dadata = {}
Dadata.options =
	serviceUrl: 'https://suggestions.dadata.ru/suggestions/api/4_1/rs'
Dadata.setToken = (token) ->
	@options.token = token

AutoForm.addInputType 'dadata',

	template: 'afDadata'

	contextAdjust: (context) ->
		context.dadata = $.extend Dadata.options, context.atts.dadata || {}
		delete context.atts.dadata
		context.dadata.type = context.dadata.type.toUpperCase()
		context.atts.value = context.value?.value
		context

	valueOut: ->
		console.log JSON.parse @attr 'data-dadata'
		JSON.parse @attr 'data-dadata'

Template.afDadata_semanticUI.onRendered ->
	self = @
	@$('input').suggestions _.extend @data.dadata, onSelect: (suggestion) ->
		input = self.$('input')
		if self.data.dadata.value
			suggestion.value = self.data.dadata.value suggestion
		input.val suggestion.value
		input.attr 'data-dadata', JSON.stringify suggestion
