Package.describe({
	name: 'fiw:autoform-dadata',
	version: '0.0.1',
	summary: 'DaData.ru for AutoForm',
	documentation: null,
});

Package.onUse(function (api) {
	api.versionsFrom('1.4.1.1');
	api.use('coffeescript');
	api.use(['templating', 'mquandalle:jade@0.4.5'], 'client');
	api.use('aldeed:autoform@4.0.0 || 5.0.0', 'client');
	api.use('jquery', 'client');
	api.addFiles([
		'dadata.jade',
		'dadata.coffee',
		'dadata/jquery.suggestions.min.js',
		'dadata/suggestions.css'
	], 'client');
	api.export('Dadata');
});