package commandobjects.register

import com.fintech.sharelink.credential.User
import grails.validation.Validateable


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
            println("UserCo username after if")
        }
        password blank: false, validator: {val,obj->
            if (!val.equals(obj.confirmPassword))
            {
                return "password mismatch"
            }
        }
        confirmPassword blank: false
        email blank: false
        firstName blank: false
        lastName blank: false
    }
}
