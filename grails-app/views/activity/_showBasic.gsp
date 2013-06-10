<%@ page import="ibmclub.Activity" %>

<g:if test="${activityInstance?.title}">
<li class="fieldcontain">
	<span id="title-label" class="property-label"><g:message code="activity.title.label" default="Title" /></span>
	<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${activityInstance}" field="title"/></span>
</li>
</g:if>

<g:if test="${activityInstance?.type}">
<li class="fieldcontain">
	<span id="type-label" class="property-label"><g:message code="activity.type.label" default="Type" /></span>
	<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${activityInstance}" field="type"/></span>
</li>
</g:if>

<g:if test="${activityInstance?.state}">
<li class="fieldcontain">
	<span id="state-label" class="property-label"><g:message code="activity.state.label" default="State" /></span>
	<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${activityInstance}" field="state"/></span>
</li>
</g:if>

<g:if test="${activityInstance?.creator}">
<li class="fieldcontain">
	<span id="creator-label" class="property-label"><g:message code="activity.creator.label" default="Creator" /></span>
	<span class="property-value" aria-labelledby="creator-label"><g:link controller="user" action="show" id="${activityInstance?.creator?.id}">${activityInstance?.creator?.encodeAsHTML()}</g:link></span>
</li>
</g:if>

<g:if test="${activityInstance?.currentCharger}">
<li class="fieldcontain">
	<span id="currentCharger-label" class="property-label"><g:message code="activity.currentCharger.label" default="Current Charger" /></span>
	
	<span class="property-value" aria-labelledby="currentCharger-label"><g:link controller="user" action="show" id="${activityInstance?.currentCharger?.id}">${activityInstance?.currentCharger?.encodeAsHTML()}</g:link></span>
	
</li>
</g:if>

<g:if test="${activityInstance?.mainTopic}">
<li class="fieldcontain">
	<span id="mainTopic-label" class="property-label"><g:message code="activity.mainTopic.label" default="Main Topic" /></span>
	<span class="property-value" aria-labelledby="mainTopic-label"><g:fieldValue bean="${activityInstance}" field="mainTopic"/></span>
</li>
</g:if>

<g:if test="${activityInstance?.proposedBeginDate}">
<li class="fieldcontain">
	<span id="proposedBeginDate-label" class="property-label">
		<g:message code="activity.proposedBeginDate.label" default="Proposed Begin Date" />
	</span>
	<span class="property-value" aria-labelledby="proposedBeginDate-label">
		<g:formatDate date="${activityInstance?.proposedBeginDate}" />
	</span>
</li>
</g:if>

<g:if test="${activityInstance?.proposedEndDate}">
<li class="fieldcontain">
	<span id="proposedEndDate-label" class="property-label">
		<g:message code="activity.proposedEndDate.label" default="Proposed End Date" />
	</span>
	<span class="property-value" aria-labelledby="proposedEndDate-label">
		<g:formatDate date="${activityInstance?.proposedEndDate}" />
	</span>
</li>
</g:if>

<g:if test="${activityInstance?.coopOrg}">
<li class="fieldcontain">
	<span id="coopOrg-label" class="property-label"><g:message code="activity.coopOrg.label" default="Coop Org" /></span>
	<span class="property-value" aria-labelledby="coopOrg-label"><g:fieldValue bean="${activityInstance}" field="coopOrg"/></span>
</li>
</g:if>

<g:if test="${activityInstance?.introduction}">
<li class="fieldcontain">
	<span id="introduction-label" class="property-label"><g:message code="activity.introduction.label" default="Introduction" /></span>
	<span class="property-value" aria-labelledby="introduction-label">
		<g:fieldValue bean="${activityInstance}" field="introduction"/>
	</span>
</li>
</g:if>

<g:if test="${activityInstance?.hasAC}">
<li class="fieldcontain">
	<span id="hasAC-label" class="property-label"><g:message code="activity.hasAC.label" default="Has AC" /></span>
	<span class="property-value" aria-labelledby="hasAC-label"><g:formatBoolean boolean="${activityInstance?.hasAC}" /></span>
</li>
</g:if>

<g:if test="${activityInstance?.note}">
<li class="fieldcontain">
	<span id="note-label" class="property-label"><g:message code="activity.note.label" default="Note" /></span>
	<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${activityInstance}" field="note"/></span>
</li>
</g:if>
