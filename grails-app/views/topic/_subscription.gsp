<g:if test="${subscrip}">
    <div class="panel panel-default" style="width: 60%;height: auto">
        <div class="page-heading">
            <div class="col-sm-6 text-left">
                Subscription
            </div>
            <div class="col-sm-6 text-right">
                <a href="#" >View All</a>
            </div>
        </div>
        <g:each in="${subscrip}" var="subscription">
            <div class="panel panel-body">
                <div style="margin-left: 10%">
                    <div class="row">
                        ${subscription.topic.name}
                    </div>
                    <div class="row">
                        <div class="col-sm-4 text-left">
                            <a href="${g.createLink(controller: "subscription",action: "unsubscripe",params: [topicid:subscription.topic.id])}">unsubscribe</a>
                        </div>
                        <div class="col-sm-4">
                            Subscription<br/>
                        </div>
                        <div class="col-sm-4">
                            Post<br/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <g:select name="seriousness" from="${com.fintech.enums.TopicVisibleEnum.Seriousness}" class="dropdown"
                                      value="${subscription.seriousness}" id="seriousness"/>
                        </div>
                        <div class="col-sm-3">
                            <g:select name="topicVisibility" from="${com.fintech.enums.TopicVisibleEnum.Visiblity}" class="dropdown"
                                      value="${subscription.topic.visiblity}" id="topicVisibility"/>
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-1"></div>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</g:if>