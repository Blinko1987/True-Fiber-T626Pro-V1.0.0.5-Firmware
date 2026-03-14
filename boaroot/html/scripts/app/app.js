// For any third party dependencies, like jQuery, place them in the lib folder.

// Configure loading modules from the lib directory,
// except for 'app' ones, which are in a sibling
// directory.
requirejs.config({
	baseUrl: '/scripts',
	paths: {
		'app': 'app',
		'lib': 'lib',
		'jquery': "lib/jquery.min",
		'main': 'app/main',
		'config': 'app/config',
		'utils': "utils/utils"
	},
	shim: {
	}
});
