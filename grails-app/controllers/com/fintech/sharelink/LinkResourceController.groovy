package com.fintech.sharelink

import com.fintech.sharelink.credential.User
import commandobjects.resources.LinkResourceCO
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured('ROLE_USER')
class LinkResourceController {
    def springSecurityService
    def linkResourceService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LinkResource.list(params), model: [linkResourceInstanceCount: LinkResource.count()]
    }

    def show(LinkResource linkResourceInstance) {
        respond linkResourceInstance
    }

    def create() {
        User user=springSecurityService.currentUser
        [topics:Topic.findAllByUser(user)]
    }

    @Transactional
    def save(LinkResourceCO linkResourceCO) {
        linkResourceCO.user = springSecurityService.currentUser
        linkResourceService.save(linkResourceCO)
        if(linkResourceService!=null)
            flash.message = "You have Entered Resource"
        else
            flash.message ="Sorry Something went wrong"
        redirect(controller: "user",action: "dashBoard")
    }

    def edit(LinkResource linkResourceInstance) {
        respond linkResourceInstance
    }

    @Transactional
    def update(LinkResource linkResourceInstance) {
        if (linkResourceInstance == null) {
            notFound()
            return
        }

        if (linkResourceInstance.hasErrors()) {
            respond linkResourceInstance.errors, view: 'edit'
            return
        }

        linkResourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LinkResourceCO.label', default: 'LinkResourceCO'), linkResourceInstance.id])
                redirect linkResourceInstance
            }
            '*' { respond linkResourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LinkResource linkResourceInstance) {

        if (linkResourceInstance == null) {
            notFound()
            return
        }

        linkResourceInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LinkResourceCO.label', default: 'LinkResourceCO'), linkResourceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'linkResource.label', default: 'LinkResourceCO'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
