package com.fintech.sharelink

import com.fintech.enums.TopicVisibleEnum
import com.fintech.sharelink.credential.User
import commandobjects.topics.TopicCO

class Topic {

    String name
    User user
    String visiblity
    Date dateCreated
    Date lastUpdated

    static constraints = {
        name blank: false,unique: true
        user blank: false
    }

    public Topic(){ }

    public Topic(TopicCO topicCO)
    {
        name = topicCO.name
        user = topicCO.user
        visiblity = topicCO.topicVisible
    }
//    static mapping = {
//        name unique: name
//    }
}
