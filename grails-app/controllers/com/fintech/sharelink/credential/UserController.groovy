package com.fintech.sharelink.credential

import com.fintech.sharelink.LinkResourceService
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
    def linkResourceService
    def springSecurityService
     static allowedMethods = [register: "POST"]//,index: "POST"]
    @Secured(["ROLE_ADMIN", "ROLE_USER"])
    def index() {

    }

    def dashBoard(){
        if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN"))
            render "ADMIN ${SpringSecurityUtils.getPrincipalAuthorities()}"
        else
        {
            def topic = userTopicService.listTopic()
            User userCurrent = springSecurityService.currentUser as User
            Subscription subscription = Subscription.findByUser(userCurrent)
            List<Topic> recievedTopics =  linkResourceService.getRenderTopics()
            def subscriptionCount = Subscription.countByUser(userCurrent)
            def topicCount = Topic.countByUser(userCurrent)
            render view: "/user/dashboard",model: [topics: topic, subscriptionCount: subscriptionCount,
                                                 topicCount: topicCount,subscrip: subscription?subscription.list(max: 5):null,
                                                 renderTopics: recievedTopics,userActive:userCurrent]
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
