/*:
 * @plugindesc The basic part of all Ulysses' plugins.
 * @author Ulysses
 *
 * @help
 * Put this plugin before all of Ulysses' other plugins.
 */

function ULYSSES_PLUGINS() {
	throw new Error('This is a static class');
}

ULYSSES_PLUGINS.register = function(version) {
	var name = this._current();
	this[name] = {
		version: version,
		parameters: () => PluginManager.parameters(name)
	};
};

ULYSSES_PLUGINS.parameters = function() {
	return this[this._current()].parameters();
};

ULYSSES_PLUGINS._current = function() {
	return document.currentScript._url.match(/js\/plugins\/(.*)\.js/)[1];
};

ULYSSES_PLUGINS.register(1);
