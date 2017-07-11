function createAllexService (execlib) {
  'use strict';
  require('../scaffolding/serviceyargs')(execlib).then(
    require('../scaffolding/servicecreator').bind(null, execlib)
  );
}

module.exports = createAllexService;
