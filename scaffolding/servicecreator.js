function createService(execlib, opts){
  var recognizer = require('./recognizer')(execlib),
     typer = require('./typer');
  opts.userizer = function(str){
      return str.replace(/user$/i,'');
  };
  var indextemplate;
  recognizer.prepare(opts);
  if(typer(opts.type, 'data')) {
    opts.isOfDataType = true;
    require('./plainwriter')(opts,'storagedescriptor.js','storagedescriptor');
  }
  opts.isOfUserType = typer(opts.type, 'user');
  require('./plainwriter')(opts,'','index');
  require('./websidecreator')(opts);
  require('./plainwriter')(opts,'websinkmapcreator.js','websinkmapcreator');
  require('./plainwriter')(opts,'sinkmapcreator.js','sinkmapcreator');
  //require('./plainwriter')(opts,'clientside.js','clientside');
  require('./plainwriter')(opts,'servicecreator.js','service');
  if(opts.extensions.indexOf('dotnet')>=0) {
    require('./dotnetcreator')(opts);
  }
  
  function roleizer(opts,item){
    opts.role = item;
    require('./servicerolecreator')(opts);
  }
  if(opts.roles){
    opts.roles.forEach(roleizer.bind(null,{force:opts.force,userizer:opts.userizer,isOfDataType:opts.isOfDataType,isOfUserType:opts.isOfUserType}));
  }
}

module.exports = createService;
