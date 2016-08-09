package com.fintech.sharelink.credential

import com.fintech.sharelink.Subscription
import com.fintech.sharelink.Topic
import com.fintech.sharelink.datavalidation.UserLoginService
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import commandobjects.register.UserCO

@Secured("permitAll")
class UserController {
    def userLoginService
    def userTopicService
    def springSecurityService
     static allowedMethods = [register: "POST"]//,index: "POST"]
    @Secured(["ROLE_ADMIN", "ROLE_USER"])
    def index() {
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN"))
            render "ADMIN ${SpringSecurityUtils.getPrincipalAuthorities()}"
        else
        {
            def topic = userTopicService.listTopic()
            User user = springSecurityService.currentUser as User
            Subscription subscription = Subscription.findByUser(user)
            def subscriptionCount = Subscription.countByUser(user)
            def topicCount = Topic.countByUser(user)
            render view: "/topic/create",model: [topics: topic, subscriptionCount: subscriptionCount,
                                                 topicCount: topicCount,subscrip: subscription?subscription.list(max: 5):null]
        }

    }

    def register(UserCO userCO) {

        User user = userLoginService.registerUser(userCO)
        println("Hello value : ${user}" )
        if(user == null)
        {
            flash.error = "error.register.unable"
            render view: "/login/auth",model: [errorinfo:userCO]
        }
        else
        {
            flash.success = "sucessful.register.message"
            render view: "/login/auth"
        }


    }


 }
