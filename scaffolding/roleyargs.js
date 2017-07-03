module.exports = require('yargs')
      .demand('r')
      .alias('r','role')
      .demand('f')
      .alias('f','force')
      .demand('t')
      .alias('t','type')
      .default({r:'',f:false,t:null})
      .argv;
