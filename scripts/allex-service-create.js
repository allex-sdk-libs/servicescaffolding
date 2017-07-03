function createAllexService (execlib) {
  'use strict';
  require('../scaffolding/serviceyargs')(execlib).then(
    require('../scaffolding/servicecreator')
  );
}

module.exports = createAllexService;
