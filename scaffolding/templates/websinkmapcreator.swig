function webSinkMapCreator(execlib, ParentSinkMap) {
  'use strict';
  var sinkmap = new (execlib.lib.Map);
  {% for role in roles -%}
    sinkmap.add('{{role}}', require('./sinks/{{role}}sinkcreator')(execlib, ParentSinkMap.get('{{role}}')));
  {% endfor %}
  return sinkmap;
}

module.exports = webSinkMapCreator;
