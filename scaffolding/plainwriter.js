var swig = require('hersswig'),
  fs = require('fs'),
  path = require('path'),
  IS_ABSOLUTE = new RegExp (/^\//);

function write(argv,filename,template){
  var template_path = template.match (IS_ABSOLUTE) ? template : path.join(__dirname,'./templates',template+'.swig');
  //TODO: check if file exists ...
  var data = swig.renderFile(template_path,argv);

  filename = filename || argv.o;
  if(!filename){
    console.log(data);
    return;
  }
  if(!argv.force && fs.existsSync(filename)){
    console.error('Refusing to write to',filename,': File already exists. You may use the -f (--force) flag to override this cowardly behavior.');
  }else{
    fs.writeFileSync(filename, data);
  }
}

module.exports = write;

