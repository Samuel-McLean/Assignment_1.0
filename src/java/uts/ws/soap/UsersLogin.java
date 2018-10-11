package uts.ws.soap;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import uts.move.user.User;
import uts.move.user.Users;

@WebService(serviceName = "UsersLogin")
public class UsersLogin {

    @WebMethod
    public Users fetchUsers() {
        Users users = new Users();
        return users;
    }
    @WebMethod
    public User fetchUser(String email) {
        User user = new User();
        return user;
    }
}
