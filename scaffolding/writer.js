var path = require('path'),
  plainwriter = require('./plainwriter');

function write(opts,dir,suffix,template){
  require('./dircreator')(dir);
  var fn = path.join(dir,opts.role.toLowerCase()+(suffix||'user')+'.js');
  plainwriter(opts,fn,template);
}

module.exports = write;
