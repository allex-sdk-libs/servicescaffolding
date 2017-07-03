function createClientSide(execlib) {
  'use strict';
  var execSuite = execlib.execSuite,
    ParentServicePack = execSuite.registry.get({{parentmodulename|safe}});

  return {
    SinkMap: require('./sinkmapcreator')(execlib, ParentServicePack)
  };
}

module.exports = createClientSide;
