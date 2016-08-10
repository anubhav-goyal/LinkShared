
<g:if test="${link}">
    <a href="${createLink(controller:'subscription',action:'deActivate',params: [topic:subscribtions.topic.id])}">UnSubscribe</a>
</g:if>
<g:else>
    <a href="${createLink(controller: "subscription",action: "activate",params: [topic: subscribtions.topic.id])}">SubScribe</a>
</g:else>

