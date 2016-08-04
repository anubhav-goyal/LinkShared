package com.fintech.sharelink.credential

import com.fintech.sharelink.datavalidation.UserLoginService
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import commandobjects.register.UserCO

@Secured("permitAll")
class UserController {
    def userLoginService
    // static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(["ROLE_ADMIN", "ROLE_USER"])
    def index() {
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN"))
            render "ADMIN ${SpringSecurityUtils.getPrincipalAuthorities()}"
        else
            render "USER  ${SpringSecurityUtils.getPrincipalAuthorities()}"

    }

    def register(UserCO userCO) {
        User user = userLoginService.registerUser(userCO)
        if(user == null)
        {
            flash.error = "error.register.unable"
            render view: "/login/auth",model: [userco:userCO]
        }
        else
        render "SuccessFull${user.id}"
    }

}
