function create{{role|capitalize}}ClientUser(execlib){
  'use strict';
  var lib = execlib.lib,
      q = lib.q,
      execSuite = execlib.execSuite,
      _ClientUser = execSuite.ClientUser;

  function {{role|capitalize}}ClientUser(prophash){
    _ClientUser.call(this,prophash);
  }
  _ClientUser.inherit({{role|capitalize}}ClientUser,require('../methoddescriptors/{{role|lower}}user'));

  return {{role|capitalize}}ClientUser;
}

module.exports = create{{role|capitalize}}ClientUser;

