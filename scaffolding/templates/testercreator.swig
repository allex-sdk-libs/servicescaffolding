function create{{prefix}}{{role|capitalize}}Tester(execlib,Tester){
  'use strict';
  var lib = execlib.lib,
      q = lib.q;

  function {{prefix}}{{role|capitalize}}Tester(prophash,client){
    Tester.call(this,prophash,client);
    console.log('runNext finish');
    lib.runNext(this.finish.bind(this,0));
  }
  lib.inherit({{prefix}}{{role|capitalize}}Tester,Tester);

  return {{prefix}}{{role|capitalize}}Tester;
}

module.exports = create{{prefix}}{{role|capitalize}}Tester;
