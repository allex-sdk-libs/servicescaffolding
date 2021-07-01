<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>netcoreapp3.1</TargetFramework>
    <WorkRoot>..\..\..\..\Work</WorkRoot>
    <AllexFundamentalsRoot>$(WorkRoot)\AllexFundamentals</AllexFundamentalsRoot>
    <RecordsSolutionRoot>$(WorkRoot)\RECORDS_SOLUTION_NAME</RecordsSolutionRoot>
    <RecordsProjectName>RECORDS_PROJECT_NAME</RecordsProjectName>
    <OutputType>Exe</OutputType>
  </PropertyGroup>

  <ItemGroup>
    <Reference Include="AllexJSCommon">
      <HintPath>$(AllexFundamentalsRoot)\AllexJSCommon\obj\$(ConfigurationName)\netstandard2.1\AllexJSCommon.dll</HintPath>
    </Reference>
    <Reference Include="AllexDataUtils">
      <HintPath>$(AllexFundamentalsRoot)\AllexDataUtils\bin\$(ConfigurationName)\netstandard2.1\AllexDataUtils.dll</HintPath>
    </Reference>
    <Reference Include="AllexSQLWorker">
      <HintPath>$(AllexFundamentalsRoot)\AllexSQLWorker\bin\$(ConfigurationName)\netstandard2.1\AllexSQLWorker.dll</HintPath>
    </Reference>
    <Reference Include="AllexJSServicePack">
      <HintPath>$(AllexFundamentalsRoot)\AllexJSServicePack\bin\$(ConfigurationName)\netcoreapp3.1\AllexJSServicePack.dll</HintPath>
    </Reference>
    <Reference Include="AllexJSSQLTableProviderServicePack">
      <HintPath>$(AllexFundamentalsRoot)\AllexJSSQLTableProviderServicePack\bin\$(ConfigurationName)\netcoreapp3.1\AllexJSSQLTableProviderServicePack.dll</HintPath>
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
    <Reference Include="RecordsData">
      <HintPath>$(RecordsSolutionRoot)\$(RecordsProjectName)\bin\$(ConfigurationName)\netcoreapp3.1\$(RecordsProjectName).dll</HintPath>
    </Reference>
  </ItemGroup>

  <ItemGroup>
    <PackageReference Include="System.Data.SqlClient" Version="4.8.2" />
    <PackageReference Include="System.Text.Json" Version="5.0.2" />
  </ItemGroup>
</Project>
