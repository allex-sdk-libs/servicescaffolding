function create{{role|capitalize}}Sink(execlib, ParentSink) {
  'use strict';
  function {{role|capitalize}}Sink(prophash, client) {
    ParentSink.call(this, prophash, client);
  }
  {% if (isOfUserType && role!=='service') %}
  ParentSink.inherit({{role|capitalize}}Sink, require('../methoddescriptors/{{userizer(role)}}user'), require('../localsinkinfo'), require('../remotesinkinfo'));
  {% else %}
  ParentSink.inherit({{role|capitalize}}Sink, require('../methoddescriptors/{{userizer(role)}}user'){% if (isOfDataType) %}, require('../visiblefields/{{userizer(role)}}user'),require('../storagedescriptor'){% endif -%});
  {% endif -%}
  {{role|capitalize}}Sink.prototype.__cleanUp = function () {
    ParentSink.prototype.__cleanUp.call(this);
  };
  return {{role|capitalize}}Sink;
}

module.exports = create{{role|capitalize}}Sink;
