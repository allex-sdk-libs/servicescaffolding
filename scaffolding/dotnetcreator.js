function createDotNet(opts){
  var typer = require('./typer'),
    isDotNetTableProvider = typer(opts.type, 'dotnettableprovider');
  var csprojsrc = isDotNetTableProvider ?
    'dotnet/servicepack.tableprovider.csproj'
    :
    'dotnet/servicepack.csproj';
  var cssrc = isDotNetTableProvider ? 
    'dotnet/servicepack.tableprovider.cs'
    :
    'dotnet/servicepack.cs';
  require('./dircreator')('dotnet');
  require('./dircreator')('.vscode');
  require('./plainwriter')(opts,'dotnet/'+opts.module_name+'.csproj',csprojsrc);
  require('./plainwriter')(opts,'dotnet/ServicePack.cs',cssrc);
  require('./plainwriter')(opts,'.vscode/tasks.json','vscode/tasks.json');
}

module.exports = createDotNet;