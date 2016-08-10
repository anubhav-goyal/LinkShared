package com.fintech.sharelink

import com.fintech.sharelink.credential.User

class Resource {
    String description
    User user
    Topic topic
    Date dateCreated
    Date lastUpdated
    static constraints = {
        description blank: false
    }
}
