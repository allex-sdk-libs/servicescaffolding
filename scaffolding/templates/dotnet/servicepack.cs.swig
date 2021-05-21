namespace AllEx.JsServicePack
{
    public class ServicePack
    {
        public static readonly string _ModuleName = "{{module_name}}";
        public class State : AllEx.State.State
        {
        }

        #region Service Section
        public interface IServiceUserState : AllEx.Service.IUserState
        {
        }
        public class ServiceUserState : State, IServiceUserState
        {
            public string name { get; set; }
        }
        public class ServiceSession : AllEx.Service.Session<ServiceUserState>
        {
            public ServiceSession(AllEx.Service.IServiceChannel channel, AllEx.Service.IUser user, ServiceUserState state, string id) : base(channel, user, state, id) { }
        }
        public class ServiceUser : AllEx.Service.User<State, Service, ServiceUserState, ServiceSession>
        {
            public ServiceUser(AllEx.Service.IRole role, string name) : base (role,name) { }
        }
        public class ServiceUserRole : AllEx.Service.Role<State, Service, ServiceUserState, ServiceUser, ServiceSession>
        {
            public ServiceUserRole(Service service, string name) : base(service, name) { }
            public override string GetModuleName()
            {
                return _ModuleName;
            }
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
        public class Session : AllEx.Service.Session<UserState>
        {
            public Session(AllEx.Service.IServiceChannel channel, AllEx.Service.IUser user, UserState state, string id) : base(channel, user, state, id) { }
        }
        public class User : AllEx.Service.User<State, Service, UserState, Session>
        {
            public User(AllEx.Service.IRole role, string name) : base (role,name) { }
        }
        public class UserRole : AllEx.Service.Role<State, Service, UserState, User, Session>
        {
            public UserRole(Service service, string name) : base(service, name) { }
            public override string GetModuleName()
            {
                return _ModuleName;
            }
        }
        #endregion
        public class Service : AllEx.Service.Microservice<State>
        {
            static Service ()
            {
                RegisterRole<IServiceUserState, ServiceUserState, ServiceSession, ServiceUser, ServiceUserRole, Service>("service");
                RegisterRole<IUserState, UserState, Session, User, UserRole, Service>("user");
            }
        }
    }
}