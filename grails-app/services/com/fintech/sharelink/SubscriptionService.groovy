package com.fintech.sharelink

import commandobjects.subscriptions.SubscriptionCO
import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {

    }

    Subscription save(SubscriptionCO subscriptionCO){
        if(subscriptionCO.validate()){}
    }

    def delete(SubscriptionCO subscriptionCO){
        Topic topic = subscriptionCO.topic
        def subscriptionRecord = Subscription.findAllByTopicAndUser(topic,subscriptionCO.user)
        subscriptionRecord.each {
            it.delete(flush: true)
        }
    }
}
