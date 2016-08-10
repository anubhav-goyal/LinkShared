<%@ page import="com.fintech.sharelink.LinkResource" %>



<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="linkResource.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${linkResourceInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="linkResource.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" value="${linkResourceInstance?.url}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="linkResource.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${com.fintech.sharelink.Topic.list()}" optionKey="id" required="" value="${linkResourceInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="linkResource.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.fintech.sharelink.credential.User.list()}" optionKey="id" required="" value="${linkResourceInstance?.user?.id}" class="many-to-one"/>

</div>

