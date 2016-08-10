package commandobjects.resources

import com.fintech.sharelink.Topic
import com.fintech.sharelink.credential.User
import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

/**
 * Created by anubhav on 9/8/16.
 */
@Validateable
class DocumentResourceCO {
    String file
    String description
    User user
    Topic topic
    MultipartFile document
    Date dateCreated
    Date lastUpdated

    static constraints={
        file blank: false
        description blank: false
    }
}
