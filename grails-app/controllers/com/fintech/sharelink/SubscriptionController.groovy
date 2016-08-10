package com.fintech.sharelink

import commandobjects.subscriptions.SubscriptionCO
import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
class SubscriptionController {

    def springSecurityService
    def subscriptionService

    def index() {}

    def activate(SubscriptionCO subscriptionCO){
        subscriptionCO.user = springSecurityService.currentUser
        subscriptionService.save(subscriptionCO)
        redirect(controller: "user",action: "dashBoard")
    }

    def deActivate(SubscriptionCO subscriptionCO){
        subscriptionCO.user = springSecurityService.currentUser
        subscriptionService.delete(subscriptionCO)
        redirect(controller: "user",action: "dashBoard")
    }

}
