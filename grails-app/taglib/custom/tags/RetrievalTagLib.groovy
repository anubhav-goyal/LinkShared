package custom.tags

import com.fintech.sharelink.Topic
import com.fintech.sharelink.credential.User

class RetrievalTagLib {
    //static defaultEncodeAs = [taglib:'html']
    static namespace = "linktopics"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def  springSecurityService
    def topics = {attrs ->
        User user = springSecurityService.currentUser as User
        def findTopic = Topic.findByUser(user)
        def topiclist;
        if(findTopic != null) {
            topiclist = findTopic.list()

            println("Hello : ${topiclist.name}")
            out  << render(template: "/templates/dropdown")

        }
    }
}
