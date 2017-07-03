var Path = require('path'),
  _execlib;

function requirer (path) {
  return function () {
    var r = require(Path.join(__dirname, 'scripts', path));
    if (_execlib.lib.isFunction(r)) {
      r(execlib);
    }
  }
}

function destroy () {
  _execlib = null;
}

function createServiceScaffolding (execlib) {
  'use strict';

  _execlib = execlib;

  return {
    scaffoldService: requirer('allex-service-create'),
    scaffoldRepo: requirer('allex-service-createrepo'),
    scaffoldRole: requirer('allex-service-createrole'),
    scaffoldWebSide: requirer('allex-service-createwebside'),
    destroy: destroy
  };
}

module.exports = createServiceScaffolding;
