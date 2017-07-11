function createRecognizer (execlib) {
  'use strict';
  var recognize = execlib.lib.moduleRecognition,
    commastring = ', ',
    plaininheritstring = "execlib.execSuite.registry.get('.')";

  function isService(desc) {
    var r = recognize(desc);
    return r && r.type === 'service';
  }

  function modulename(inh) {
    var r = recognize(inh);
    if (!r) {
      return "'"+inh+"'";
    }
    return "'"+r.modulename+"'";
  }

  function varname(inh) {
    var r = recognize(inh);
    if (!r) {
      return inh;
    }
    return r.servicename+r.type;
  }

  function prepare(opts) {
    var ds = opts.depends.length ? opts.depends.slice() : [];
    if (opts.depends.length) {
      opts.serviceextravars = commastring+opts.depends.map(varname).join(commastring);
    }
    if (opts.inherit) {
      ds.unshift(opts.inherit);
    }
    if (ds.length) {
      opts.dependmodulenames = ds.map(modulename).join(",\n");
      opts.indexvarnames = commastring+ds.map(varname).join(commastring);
      opts.servicecallvarnames = opts.indexvarnames;
      if (!opts.inherit) {
        opts.servicecallvarnames = commastring + plaininheritstring + opts.servicecallvarnames;
      }
    } else {
      opts.dependmodulenames = '';
      opts.indexvarnames = '';
      opts.servicecallvarnames = plaininheritstring;
    }
    if (opts.inherit) {
      opts.parentmodulename = modulename(opts.inherit);
      opts.parentservicepackname = varname(opts.inherit);
    } else {
      opts.parentmodulename = "'.'";
      opts.parentservicepackname = plaininheritstring;
    }
  }

  return {
    isService: isService,
    prepare: prepare
  };
}

module.exports = createRecognizer;

