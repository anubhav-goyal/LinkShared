<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="header">
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default" style="width: 60%;height: auto">
            <div class="panel-body">
                <div class="row text-center">
                    <b>${userActive.username}</b>
                </div>

                <div class="col-sm-6">
                    Subscription<br/>
                    ${subscriptionCount?subscriptionCount:""}
                </div>
                <div class="col-sm-6 text-right">
                    Topic<br/>
                    ${topicCount?topicCount:""}
                </div>
            </div>
        </div>
        <g:if test="${subscrip}">
            <div class="panel panel-default" style="width: 70%;height: auto">
            <div class="page-heading">
                <div class="col-sm-6 text-left">
                    <h6>Subscription</h6>
                </div>
                <div class="col-sm-6 text-right">
                    <h6><a href="${g.createLink(controller: "topic",action: "show")}" >View All</a></h6>
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
                                <a href="${g.createLink(controller: "subscription",action: "deActivate",params: [topic:subscription.topic])}">unsubscribe</a>
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

        <div class="row">
            <div class="panel panel-default" style="width: 70%">
                <div class="panel-heading">
                    <h5>Trending Topics</h5>
                </div>
                <g:each in="${renderTopics}" var="topics">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <a href="#">${topics.name}</a>
                        </div>
                    </div>
                    <div class="row">
                            <sub:subscribe topicObj="${topics}"/>
                    </div>
                </div>
                    <g:if test="${(userActive.admin)||(userActive.username == topics.user.username)}">
                        <div class="panel-body">

                        </div>
                    </g:if>
                </g:each>
            </div>
        </div>

    </div>

    <div class="col-md-6">
        <div class="panel panel-default" style="width: 70%">
            <div class="panel-heading">
                <h2>Create Topic</h2>
            </div>
            <div class="panel-body">
                <g:form class="form-horizontal" method="post" controller="topic" action="insert">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="name" id="name" placeholder="name" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="topicVisible" class="col-sm-3 control-label">Visibility</label>
                        <div class="col-sm-9">
                            <g:select name="topicVisible" from="${com.fintech.enums.TopicVisibleEnum.Visiblity}" id="topicVisible"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Create</button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h5>Link Resource</h5>
            </div>
            <div class="panel-body">
                <g:form class="form-horizontal" method="post" controller="linkResource" action="save">
                    <div class="form-group text-center">
                        <g:if test="${flash.message}">
                            ${flash.message}
                        </g:if>
                    </div>
                    <div class="form-group">
                        <label for="Url" class="col-sm-2 control-label">URL</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="url" id="url" placeholder="url" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="description" id="description" placeholder="Description" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="topic" class="col-sm-2 control-label">Topic</label>
                        <div class="col-sm-10">
                            <g:select name="topic" from="${topics}" optionKey="id" optionValue="name"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Create</button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
                <h5>Document Resource</h5>
            </div>
            <div class="panel-body">
                <g:form class="form-horizontal" method="post" controller="documentResource" action="save">
                    <div class="form-group text-center">
                        <g:if test="${flash.documentmessage}">
                            ${flash.documentmessage}
                        </g:if>
                    </div>
                    <div class="form-group">
                        <label for="document" class="col-sm-2 control-label">File</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" name="document" id="document" placeholder="url" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description_doc" class="col-sm-2 control-label">Description</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="description" id="description_doc" placeholder="Description" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="topic" class="col-sm-2 control-label">Topic</label>
                        <div class="col-sm-10">
                            <g:select name="topic" from="${topics}" optionKey="id" optionValue="name"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Create</button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
    </div>
</body>
</html>
