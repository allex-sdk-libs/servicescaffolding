<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>netcoreapp3.1</TargetFramework>
    <AllexWorkRoot Condition="'$(AllexWorkRoot)' == '' ">..\..\..\..\Work</AllexWorkRoot>
    <AllexFundamentalsRoot>$(AllexWorkRoot)\AllexFundamentals</AllexFundamentalsRoot>
  </PropertyGroup>

  <ItemGroup>
    <Reference Include="AllexJSCommon">
      <HintPath>$(AllexFundamentalsRoot)\AllexJSCommon\obj\$(ConfigurationName)\netstandard2.1\AllexJSCommon.dll</HintPath>
    </Reference>
    <Reference Include="AllexJSClient">
      <HintPath>$(AllexFundamentalsRoot)\AllexJSClient\obj\$(ConfigurationName)\netcoreapp3.1\AllexJSClient.dll</HintPath>
    </Reference>
    <Reference Include="AllexService">
      <HintPath>$(AllexFundamentalsRoot)\AllexService\bin\$(ConfigurationName)\netstandard2.1\AllexService.dll</HintPath>
    </Reference>
    <Reference Include="AllexJson">
      <HintPath>$(AllexFundamentalsRoot)\AllexJson\bin\$(ConfigurationName)\netstandard2.1\AllexJson.dll</HintPath>
    </Reference>
    <Reference Include="AllexExecution">
      <HintPath>$(AllexFundamentalsRoot)\AllexExecution\bin\$(ConfigurationName)\netstandard2.1\AllexExecution.dll</HintPath>
    </Reference>
    <Reference Include="AllexState">
      <HintPath>$(AllexFundamentalsRoot)\AllexState\bin\$(ConfigurationName)\netstandard2.1\AllexState.dll</HintPath>
    </Reference>
  </ItemGroup>

  <ItemGroup>
    <PackageReference Include="System.Text.Json" Version="5.0.2" />
  </ItemGroup>

</Project>