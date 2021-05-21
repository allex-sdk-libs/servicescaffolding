function finalize (execlib, argv, r) {
  'use strict';
  var lib = execlib.lib;
  argv.translatedinherit = r.modulename;
  if(argv.roles.indexOf('service')<0){
    argv.roles.push('service');
  }
  return lib.q(argv);
}

function onRecognize (execlib, argv, r) {
  'use strict';
  var lib = execlib.lib;
  if (lib.isString(r)) {
    console.error(r, 'was not recognized as an AllexJS module, cannot create a Service repository');
    return lib.q.reject(new Error(r+' was not recognized as an AllexJS module, cannot create a Service repository'));
  }
  argv.git = r.gitclonestring;
  if (argv.inherit !== '.') {
    return lib.moduleRecognition(argv.inherit).then(finalize.bind(null, execlib, argv));
  } else {
    return finalize(execlib, argv, {modulename: '.'});
  }
}

function createServiceYargs (execlib) {
  'use strict';
  var argv = require('yargs')
      .option('a', {
        'alias': 'author',
        'default': 'HERS Belgrade'
      })
      .option('u', {
        'alias': 'username',
        'default': 'allex'
      })
      .demand('p')
      .alias('p','prefix')
      .demand('r')
      .alias('r','roles')
      .array('r')
      .demand('f')
      .alias('f','force')
      .demand('o')
      .alias('o','output')
      .demand('i')
      .alias('i', 'inherit')
      .demand('d')
      .alias('d','depends')
      .array('d')
      .demand('t')
      .alias('t','type')
      .demand('n')
      .alias('n','namespace')
      .demand('e')
      .alias('e','extensions')
      .array('e')
      .default({p:'',f:false,o:'index.js',i:'.',r:[],d:[],t:null,n:'',e:[]})
      .argv;
  argv.namespaceizer = function(){
    return argv.namespace ? '_'+argv.namespace.toLowerCase()+'_' : '';
  }
  argv.namespaceurlizer = function(){
    return argv.namespace ? '_'+argv.namespace.toLowerCase()+'_' : '_';
  }

  argv.module_name = argv.username+'_'+argv.namespaceizer()+argv.prefix.toLowerCase()+'service';
  return execlib.lib.moduleRecognition(argv.module_name).then(onRecognize.bind(null, execlib, argv));
}

module.exports = createServiceYargs;
