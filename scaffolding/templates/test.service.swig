var execlib=require('hers_exectesting')();

execlib.test({
  debug_brk: false,
  debug: false,
  name:'{{prefix}}',
  modulepath:'./{{output}}',
  propertyhash: {
  }
},{
  debug_brk: false,
  debug: false,
  tests:[
  {% for role in roles -%}
  {
    count:2,
    role: '{{role|lower}}',
    tester:{
      count:2,
      modulepath:'./test/{{prefix|lower}}{{role|lower}}testercreator',
      propertyhash:{
      }
    }
  }{% if loop.last %} {% else %},{% endif %}
  {% endfor -%}
  ]
});

