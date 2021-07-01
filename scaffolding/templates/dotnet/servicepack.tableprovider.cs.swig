using System.Text.Json;
using System.Text.Json.Serialization;
using AllEx.Json;
using AllEx.Execution;

using System;

using AllEx.State.PathExtensions;

namespace {{dotnetnamespace}}
{
    public static class ProgrmaMockup
    {
        public static void Main() { }
    }
    public class NameProvider : AllEx.JsServicePack.IModuleNameProvider
    {
        public string ModuleName() { return "{{module_name}}"; }
    }
    public class ServicePack : AllEx.JsServicePack.SQLTableProvider.ServicePack<DB_RECORD_TYPE, APP_RECORD_TYPE, NameProvider>
    {
    }
}