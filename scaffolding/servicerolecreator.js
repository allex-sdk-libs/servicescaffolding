function createServiceRole(opts){
  require('./writer')(opts,'sinks','sinkcreator','sink');
  opts.role = opts.role.replace(/user$/i,'');
  require('./writer')(opts,'users','usercreator','user');
  require('./writer')(opts,'methoddescriptors','','methoddescriptor');
  if(opts.isOfDataType){
    require('./writer')(opts,'visiblefields','','visiblefields');
  }
}

module.exports = createServiceRole;
