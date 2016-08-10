package com.fintech.sharelink

import commandobjects.resources.LinkResourceCO

class LinkResource extends Resource {
String url;
    static constraints = {
        url blank: false
    }

    LinkResource(LinkResourceCO linkResourceCO){
        url = linkResourceCO.url
        description = linkResourceCO.description
        user = linkResourceCO.user
        topic = linkResourceCO.topic
    }
}
