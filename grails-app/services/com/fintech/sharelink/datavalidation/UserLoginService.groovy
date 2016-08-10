package com.fintech.sharelink.datavalidation

import com.fintech.sharelink.Topic
import com.fintech.sharelink.credential.Role
import com.fintech.sharelink.credential.User
import com.fintech.sharelink.credential.UserRole
import commandobjects.register.UserCO
import grails.transaction.Transactional
import org.springframework.security.crypto.codec.Base64
import org.springframework.web.multipart.commons.CommonsMultipartFile


class UserLoginService {
    static transactional = false
    def serviceMethod() {

    }

    Boolean checkData(){
        Integer rowsUser = User.count
        Integer rowsRole = Role.count
        Integer userRole = UserRole.count
        if (rowsUser>0 && rowsRole >=2 && userRole>0)
        {
            return  true
        }
        return false
    }
@Transactional
    def create()
    {
        Role roleAdmin = new Role(authority: "ROLE_ADMIN")
        Role roleUser = new Role(authority: "ROLE_USER")
        roleAdmin.save()
        roleUser.save()
        User adminUser = new User(username: "anubhav", password: "12345",firstName: "Anubhav",
                lastName: "Goyal",email: "Anubhavgoyal@gmail.com",admin: true,active: true,
                createdDate: new Date(),modifiedDate: new Date())
        User simpleUser = new User(username: "test", password: "123",firstName: "Anubhav",
                lastName: "Goyal",email: "Anubhavgoyal@gmail.com",admin: false,active: true,
                createdDate: new Date(),modifiedDate: new Date())
        adminUser.save()
        simpleUser.save()
        UserRole admin = new UserRole(adminUser, roleAdmin)
        UserRole simple = new UserRole(simpleUser, roleUser)
        simple.save()
        admin.save()

    }


    @Transactional
    User registerUser(UserCO userCO, boolean saveAdmin = false ){
        if (userCO.validate()) {
            User user = new User(userCO,saveAdmin)
            user.save()
            return user;
        }else {
            return null
        }
    }

//    String downloadPhotoInFolder(UserCO userCO)
//    {
//        String locationPhoto = ""
//        CommonsMultipartFile f = userCO.uploadPhoto
//        final String name = userCO.username
//
//        def fos= new FileOutputStream(new File("/home/anubhav/practice/LinkShared/web-app/user_image/${name}"))
//        f.getBytes().each{ fos.write(it) }
//        locationPhoto=Base64.encode(f.getBytes()).toString()
//        fos.flush()
//        fos.close()
//        return locationPhoto
//    }
}
