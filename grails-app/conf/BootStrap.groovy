import com.fintech.sharelink.credential.Role;
import com.fintech.sharelink.credential.User;
import com.fintech.sharelink.credential.UserRole;
class BootStrap {

    def init = { servletContext ->
        Role roleAdmin = new Role(authority : "ROLE_ADMIN");
        roleAdmin.save();
        Role roleUser = new Role(authority: "ROLE_USER");
        roleUser.save();
        User adminUser = new User(username: "anubhav",password: "12345");
        adminUser.save();
        UserRole admin = new UserRole(adminUser,roleAdmin);
        admin.save()
    }
    def destroy = {
    }
}
