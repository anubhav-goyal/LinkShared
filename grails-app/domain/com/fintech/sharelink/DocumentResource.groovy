package com.fintech.sharelink

import commandobjects.resources.DocumentResourceCO

class DocumentResource extends Resource {
String filePath
    static constraints = {
        filePath blank: false
    }

    DocumentResource(DocumentResourceCO documentResourceCO){
        filePath = documentResourceCO.file
        user  = documentResourceCO.user
        topic = documentResourceCO.topic
        description = documentResourceCO.description
    }
}
