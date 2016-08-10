<%@ page import="com.fintech.sharelink.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="topic.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${topicInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="topic.user.label" default="User"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${com.fintech.sharelink.credential.User.list()}" optionKey="id" required=""
              value="${topicInstance?.user?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'visiblity', 'error')} required">
    <label for="visiblity">
        <g:message code="topic.visiblity.label" default="Visiblity"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="visiblity" required="" value="${topicInstance?.visiblity}"/>

</div>

