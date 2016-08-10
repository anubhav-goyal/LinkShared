package com.fintech.sharelink

import com.fintech.sharelink.credential.User
import commandobjects.topics.TopicCO
import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
class TopicController {
 def springSecurityService
    def userTopicService
    def index() {
        render view: "/topic/create"
    }

    def insert(TopicCO topicCO) {
        topicCO.user = springSecurityService.currentUser
        userTopicService.insert(topicCO)
        User user = springSecurityService.currentUser as User
        def subscriptionCount = Subscription.countByUser(user)
        def topicCount = Topic.countByUser(user)
        render view: "/topic/create",model: [subscriptionCount: subscriptionCount, topicCount: topicCount]
//        def topic = retrieveList()
//        render view: "/topic/create", model: [topics:topic]
    }

    def delete(String name) {
        userTopicService.deleteTopic(name)
        def topic = retrieveList()
        flash.message = "Record has been deleted"
        render view: "/topic/modifiedtopic",model: [topics: topic]
    }

    def update(TopicCO topicCO) {
        String id = params.id
        if (id!=null) {
            Topic topic = userTopicService.update(topicCO, params.id)
            if (topic != null) {
                flash.message = "Updation Successfull"

            } else {
                flash.message = "Sorry Try Again"
            }
        }
        def record = retrieveList()
        render view: "/topic/uploadtopic",model: [topics: record]
    }

    def show() {
      def topic =  retrieveList()
    render view: "/topic/modifiedtopic", model: [topics:topic]
    }

    def edit(String name)
    {
        def record = userTopicService.getData(name)
        if(record!=null){
            render view: "/topic/updatetopic", model: [records:record]
        }
        else
        {
            render view: "/topic/uploadtopic"
        }

    }

    def retrieveList(){
        return userTopicService.listTopic()
    }
}
