package custom.tags

import com.fintech.sharelink.Resource
import com.fintech.sharelink.Subscription
import com.fintech.sharelink.Topic
import com.fintech.sharelink.credential.User

class SubscriptionTopicsTagLib {

    static namespace = "sub"
    def springSecurityService

    def subscribe = { attr,body->

        User user = springSecurityService.currentUser as User
        Topic topic = attr.topicObj
        String returnLink

        def subScribeUser = Subscription.findAllByTopic(topic)
        def totalSubscription = Subscription.countByTopic(topic)
        def totalPosts = Resource.countByTopic(topic)

        if((subScribeUser.user.id).contains(user.id)){
        returnLink = "Successful"
        }
        else {
        returnLink = null
        }
        out<< render(template: "/templates/createLink",model: [link:returnLink,totalSubscription:totalSubscription,
        totalPost: totalPosts,subscribtions:subScribeUser])

    }

    def totalSubscribe = { attr,body->
        User user = springSecurityService.currentUser as User
        Topic topic = attr.topicObj
        Integer subScribeTotal = Subscription.countByTopic(topic)
        out << subScribeTotal
    }

    def totalPosts = { attr,body->
        User user = springSecurityService.currentUser as User
        Topic topic = attr.topicObj
        Integer postsTotal = Resource.countByTopic(topic)
        out << postsTotal
    }
}
