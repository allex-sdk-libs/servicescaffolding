var fs = require('fs');

function createIfNoDir(path){
  var exists = fs.existsSync(path);
  if(exists){
    var isdir = fs.statSync(path).isDirectory();
  }
  if(!exists){
    fs.mkdirSync(path);
  }
}

module.exports = createIfNoDir;
