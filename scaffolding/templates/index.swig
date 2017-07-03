function createServicePack(execlib) {
  'use strict';
  return {
    service: {
      dependencies: ['{{inherit}}']
    },
    sinkmap: {
      dependencies: ['{{inherit}}']
    }, /*
    tasks: {
      dependencies: []
    }
    */
  }
}

module.exports = createServicePack;
