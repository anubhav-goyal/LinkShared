package commandobjects.subscriptions

import com.fintech.enums.TopicVisibleEnum
import com.fintech.sharelink.Topic
import com.fintech.sharelink.credential.User
import grails.validation.Validateable

/**
 * Created by anubhav on 9/8/16.
 */
@Validateable
class SubscriptionCO {
    User user;
    Topic topic;
    Date dateCreated;
    TopicVisibleEnum.Seriousness seriousness;

    static constraints = {
        user blank:false
        topic blank:false
        seriousness nullable: false
    }

}
