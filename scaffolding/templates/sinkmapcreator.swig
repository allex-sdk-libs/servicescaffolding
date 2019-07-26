function sinkMapCreator(execlib, ParentSinkMap) {
  'use strict';
  var sinkmap = require('./websinkmapcreator')(execlib, ParentSinkMap);
  //add roles that should not be visible to the browser
  return sinkmap;
}

module.exports = sinkMapCreator;
