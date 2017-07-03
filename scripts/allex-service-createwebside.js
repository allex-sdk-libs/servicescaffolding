function createAllexServiceWebSide (execlib) {
  'use strict';
  require('../scaffolding/serviceyargs')(execlib).then(
    require('../scaffolding/websidecreator')
  );
}

module.exports = createAllexServiceWebSide;
