function create{{role|capitalize}}User(execlib, ParentUser) {
  'use strict';
  if (!ParentUser) {
    ParentUser = execlib.execSuite.ServicePack.Service.prototype.userFactory.get('user');
  }

  function {{role|capitalize}}User(prophash) {
    ParentUser.call(this, prophash);
  }
  {% if (isOfUserType) %}
  var localsinkinfo = require('../localsinkinfo'),
    remotesinkinfo = require('../remotesinkinfo'),
    visiblefields = [];
  localsinkinfo.forEach(function(localsink){
    visiblefields.push('have'+localsink.name);
  });
  remotesinkinfo.forEach(function(remotesink){
    visiblefields.push('have'+execlib.execSuite.userServiceSuite.nameOfRemoteSinkDescriptor(remotesink));
  });
  ParentUser.inherit({{role|capitalize}}User, require('../methoddescriptors/user'), visiblefields.concat([/*visible state fields here*/]));
  {% else %}
  ParentUser.inherit({{role|capitalize}}User, require('../methoddescriptors/{{userizer(role)}}user'), [/*visible state fields here*/]/*or a ctor for StateStream filter*/{% if (isOfDataType) %}, require('../visiblefields/{{userizer(role)}}user'){% endif -%});
  {% endif -%}
  {% if (isOfUserType) %}
    visiblefields = null;
  {% endif -%}
  {{role|capitalize}}User.prototype.__cleanUp = function () {
    ParentUser.prototype.__cleanUp.call(this);
  };

  return {{role|capitalize}}User;
}

module.exports = create{{role|capitalize}}User;
