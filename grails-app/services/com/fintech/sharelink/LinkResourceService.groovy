package com.fintech.sharelink

import commandobjects.resources.LinkResourceCO
import grails.transaction.Transactional

@Transactional
class LinkResourceService {

    def serviceMethod() {

    }

    Resource save(LinkResourceCO linkResourceCO){
        if(linkResourceCO.validate()){
            LinkResource linkResource = new LinkResource(linkResourceCO)
            linkResource.save()
        }

    }

    List<Topic> getRenderTopics(){
        def create = Resource.createCriteria()
        def topics = create.list(max:5) {
            projections{
                groupProperty("topic")
            }
            rowCount("rows")
            order("rows","desc")
        }*.getAt(0)

        return topics
    }
}
