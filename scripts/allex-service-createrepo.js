function createAllexServiceRepo (execlib) {
  'use strict';
  require('../scaffolding/serviceyargs')(execlib).then(run.bind(null, execlib), console.error.bind(console, 'Error:'));
}

function run (execlib, argv) {
  var fs = require('fs'),
    plainwriter = require('../scaffolding/plainwriter'),
    path = require('path'),
    lib = execlib.lib;

  if (!argv) {
    return;
  }
  plainwriter(argv,'package.json','package.json');
  plainwriter(argv,'README.md','README');
  plainwriter(argv,'.gitignore','gitignore');

  if(argv.roles.indexOf('user') >= 0 && argv.type === 'user'){
    plainwriter({},'localsinkinfo.js','localsinkinfo');
    plainwriter({},'remotesinkinfo.js','remotesinkinfo');
  }

  require('../scaffolding/servicecreator')(execlib, argv);
  argv = null;
}

module.exports = createAllexServiceRepo;
