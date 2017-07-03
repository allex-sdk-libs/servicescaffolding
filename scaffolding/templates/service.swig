function create{{prefix}}Service(execlib, ParentService{{serviceextravars}}) {
  'use strict';
  {% if (isOfDataType) %}var dataSuite = execlib.dataSuite;{% endif %}

  function factoryCreator(parentFactory) {
    return { {%- if roles %}{% for item in roles %}
      '{% if item.length %}{{item}}{% else %}user{% endif %}': require('./users/{{userizer(item)}}usercreator')(execlib, parentFactory.get('{{item}}')){% if loop.last %} {% else %},{% endif %}{% endfor %}{% endif %}
    };
  }

  function {{prefix}}Service(prophash) {
    ParentService.call(this, prophash);
  }
  {% if (isOfUserType) %}
  ParentService.inherit({{prefix}}Service, factoryCreator, void 0, {
    local: require('./localsinkinfo'),
    remote: require('./remotesinkinfo')
  });
  {% else %}
  ParentService.inherit({{prefix}}Service, factoryCreator{% if (isOfDataType) %}, require('./storagedescriptor'){% endif -%});
  {% endif %}
  {{prefix}}Service.prototype.__cleanUp = function() {
    ParentService.prototype.__cleanUp.call(this);
  };
  {% if (isOfDataType) %}{{prefix}}Service.prototype.createStorage = function(storagedescriptor) {
    return ParentService.prototype.createStorage.call(this, storagedescriptor);
  };{% endif %}
  return {{prefix}}Service;
}

module.exports = create{{prefix}}Service;
