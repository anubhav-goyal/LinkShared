package commandobjects.topics

import com.fintech.enums.TopicVisibleEnum
import com.fintech.sharelink.credential.User
import grails.validation.Validateable

/**
 * Created by anubhav on 5/8/16.
 */
@Validateable
class TopicCO {
    String name
    User user
    Date createdDate
    Date lastUpdated
    TopicVisibleEnum.Visiblity topicVisible

    static constraints={
        name blank: false
        topicVisible nullable: false
       //
    }
}
