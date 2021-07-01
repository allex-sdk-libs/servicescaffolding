using System.Text.Json;
using System.Text.Json.Serialization;
using AllEx.Json;
using AllEx.Execution;

using System;

using AllEx.State.PathExtensions;

namespace {{dotnetnamespace}}
{
    public class ServicePack
    {
        public static readonly string _ModuleName = "{{module_name}}";
        public class ClientSide
        {
            public static void Register()
            {
                AllEx.JSBridge.TypesPerModule.Register<ServiceUserState, ServiceUserSink>("service", _ModuleName);
                AllEx.JSBridge.TypesPerModule.Register<UserState, UserSink>("user", _ModuleName);
            }
            [JsonObjectParseable]
            public class State : AllEx.State.State
            {
                //public DateTime Now {get; set;}
            }

            #region Service Section
            public interface IServiceUserState : AllEx.Service.IUserState
            {
            }
            public class ServiceUserState : State, IServiceUserState
            {
                public string name { get; set; }
            }
            public interface IServiceUserFunctionality
            {
            }
            public class ServiceUserSink : AllEx.JSBridge.SinkOnExistingSession<ServiceUserState>, IServiceUserFunctionality
            {
                public ServiceUserSink(AllEx.JSBridge.IChannel channel, string existingsession) : base(channel, existingsession) {}
            }
            #endregion

            #region User Section
            public interface IUserState : AllEx.Service.IUserState
            {
            }
            public class UserState : State, IUserState
            {
                public string name { get; set; }
            }
            public interface IUserFunctionality
            {
                //PromiseWithProgress<DateTime, object> inMyTimeZone(string timezonename);
            }
            public class UserSink : AllEx.JSBridge.SinkOnExistingSession<UserState>, IUserFunctionality
            {
                public UserSink(AllEx.JSBridge.IChannel channel, string existingsession) : base(channel, existingsession) {}
                /*
                public PromiseWithProgress<DateTime, object> inMyTimeZone(string timezonename)
                {
                    return InvokeMethod<DateTime, object>(new object[] { timezonename });
                }
                */
            }
            #endregion
        }


        #region Service Section
        public class ServiceSession : AllEx.Service.Session<ClientSide.ServiceUserState>
        {
            public ServiceSession(AllEx.Service.IServiceChannel channel, AllEx.Service.IUser user, ClientSide.ServiceUserState state, string id) : base(channel, user, state, id) { }
        }
        public class ServiceUser : AllEx.Service.User<ClientSide.State, Service, ClientSide.ServiceUserState, ServiceSession>
        {
            public ServiceUser(AllEx.Service.IRole role, string name) : base(role, name) { }
        }
        public class ServiceUserRole : AllEx.Service.Role<ClientSide.State, Service, ClientSide.ServiceUserState, ServiceUser, ServiceSession>
        {
            public ServiceUserRole(Service service, string name) : base(service, name) { }
            public override string GetModuleName()
            {
                return _ModuleName;
            }
        }
        #endregion

        #region User Section
        public class Session : AllEx.Service.Session<ClientSide.UserState>
        {
            public Session(AllEx.Service.IServiceChannel channel, AllEx.Service.IUser user, ClientSide.UserState state, string id) : base(channel, user, state, id) { }
        }
        public class User : AllEx.Service.User<ClientSide.State, Service, ClientSide.UserState, Session>
        {
            public User(AllEx.Service.IRole role, string name) : base(role, name) { }

            #region Methods
            /*
            public void inMyTimeZone(string timezonename, AllexDeferWithProgress<DateTime, object> defer)
            {
                try {
                    defer.Resolve(MyService.NowInTimeZone(timezonename));
                }
                catch (Exception e){
                    defer.Reject(e);
                }
            }
            */
            #endregion
        }
        public class UserRole : AllEx.Service.Role<ClientSide.State, Service, ClientSide.UserState, User, Session>
        {
            public UserRole(Service service, string name) : base(service, name) { }
            public override string GetModuleName()
            {
                return _ModuleName;
            }
        }
        #endregion

        [JsonObjectParseable]
        public class ServiceConfiguration : AllEx.JsCommon.SpawnDescriptor
        {

        }
        public class Service : AllEx.Service.Microservice<ClientSide.State>
        {
            static Service()
            {
                RegisterRole<ClientSide.IServiceUserState, ClientSide.ServiceUserState, ServiceSession, ServiceUser, ServiceUserRole, Service>("service");
                RegisterRole<ClientSide.IUserState, ClientSide.UserState, Session, User, UserRole, Service>("user");
            }

            public Service (ServiceConfiguration config){
                //Clock = new ClockImplementation(1000);
                //Clock.Tick += OnTick;
            }

            #region Properties
            //ClockImplementation Clock {get;}
            #endregion

            #region Methods
            /*
            public DateTime NowInTimeZone (string timezoneid)
            {
                return TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById(timezoneid));
            }
            */
            #endregion

            #region Event Handlers
            /*
            private void OnTick(object sender, TimerEventArgs args)
            {
                State.Set("Now".ToPath(), args.Time);
            }
            */
            #endregion
        }
     }
}