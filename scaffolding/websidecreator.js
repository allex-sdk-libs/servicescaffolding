function createWebSide(opts){
  require('./dircreator')('web_component');
  require('./plainwriter')(opts,'browserify.js','browserify');
  require('./plainwriter')(opts,'web_component/protoboard.json','protoboard.json');
}

module.exports = createWebSide;
