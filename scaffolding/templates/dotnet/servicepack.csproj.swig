<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>netcoreapp3.1</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <Reference Include="AllexJSClient">
      <HintPath>..\..\..\..\Work\AllexFundamentals\AllexJSClient\obj\$(ConfigurationName)\netcoreapp3.1\AllexJSClient.dll</HintPath>
    </Reference>
    <Reference Include="AllexService">
      <HintPath>..\..\..\..\Work\AllexFundamentals\AllexService\bin\$(ConfigurationName)\netstandard2.1\AllexService.dll</HintPath>
    </Reference>
    <Reference Include="AllexState">
      <HintPath>..\..\..\..\Work\AllexFundamentals\AllexState\bin\$(ConfigurationName)\netstandard2.1\AllexState.dll</HintPath>
    </Reference>
  </ItemGroup>

</Project>