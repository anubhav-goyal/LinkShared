package com.fintech.sharelink


import commandobjects.topics.TopicCO
import grails.transaction.Transactional

@Transactional
class UserTopicService {

    def serviceMethod() {

    }

    Topic insert(TopicCO topicCO)
    {
        if(topicCO.validate())
        {
            Topic topic = new Topic(topicCO)
            topic.save()
            Subscription subscription = new Subscription(topic)
            subscription.save()
            return topic
        }
    }

    def listTopic(){
        Topic.getAll()
    }

    Topic getData(String name){
        return Topic.findByName(name)
    }
    def deleteTopic(String name){
        def record = Topic.findByName(name)
        record.delete()
    }

    Topic update(TopicCO topicCO, String id){
        if(topicCO.validate()) {
            Topic topic = Topic.findById(id)
            topic.name = topicCO.name
            topic.visiblity = topicCO.topicVisible
            topic.save(flush: true)
//        Topic topic = new Topic(topicCO)
//        println topic.save()
            topic
        }

    }

}
