function createDotNet(opts){
  require('./dircreator')('dotnet');
  require('./plainwriter')(opts,'dotnet/ServicePack.csproj','dotnet/servicepack.csproj');
  require('./plainwriter')(opts,'dotnet/ServicePack.cs','dotnet/servicepack.cs');
}

module.exports = createDotNet;