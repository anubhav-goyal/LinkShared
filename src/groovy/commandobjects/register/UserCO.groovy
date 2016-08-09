package commandobjects.register

import com.fintech.sharelink.credential.User
import grails.validation.Validateable
import org.springframework.web.multipart.commons.CommonsMultipartFile


/**
 * Created by anubhav on 4/8/16.
 */
@Validateable
class UserCO{
    String username
    String password

    String firstName
    String lastName
    String email
    String confirmPassword
//    CommonsMultipartFile uploadPhoto
//    String photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated

    static constraints = {
        username blank: false, validator: {val,obj ->
                   User user = User.findByUsername(val)
            if(user)
            {
                return "User Already Exists"
            }
        }
        password blank: false, validator: {val,obj->
            if (!val.equals(obj.confirmPassword))
            {
                return "password mismatch"
            }
        }
        confirmPassword blank: false
        email blank: false, email: true
        firstName blank: false
        lastName blank: false
//        uploadPhoto nullable: true,blank: true
//        photo nullable: true,blank: true

    }
}
