
class BootStrap {
    def userLoginService
    def init = { servletContext ->

        if(!userLoginService.checkData()) {
            userLoginService.create()
        }

    }
    def destroy = {
    }
}
