package commandobjects.resources

import com.fintech.sharelink.Topic
import com.fintech.sharelink.credential.User
import grails.validation.Validateable

/**
 * Created by anubhav on 8/8/16.
 */
@Validateable
class LinkResourceCO {
    String url
    String description
    User user
    Topic topic
    Date dateCreated
    Date lastUpdated

    static constraints={
        url blank: false
        description blank: false
    }
}
