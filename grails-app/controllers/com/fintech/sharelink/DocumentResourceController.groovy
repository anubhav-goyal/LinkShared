package com.fintech.sharelink

import commandobjects.resources.DocumentResourceCO
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("ROLE_USER")
class DocumentResourceController {

   // static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def springSecurityService
    def documentResourceService

    def index() {

    }

    def save(DocumentResourceCO documentResourceCO){
        documentResourceCO.user = springSecurityService.currentUser
        def resource = documentResourceService.save(documentResourceCO)
        if(resource)
            flash.documentmessage = "Record Added"
        else
            flash.documentmessage = "Sorry !Not Uploaded"
        redirect(controller: "user",action: "dashBoard")
    }


}
