package com.fintech.sharelink

import com.fintech.enums.TopicVisibleEnum
import com.fintech.sharelink.credential.User
import commandobjects.topics.TopicCO

class Subscription {
    User user;
    Topic topic;
    Date dateCreated;
    TopicVisibleEnum.Seriousness seriousness;

    static constraints = {
        user blank:false
        topic blank:false
        seriousness nullable: false
    }

    Subscription(Topic topic){
        user = topic.user
        this.topic = topic
        seriousness = TopicVisibleEnum.Seriousness.SERIOUS
    }
}
