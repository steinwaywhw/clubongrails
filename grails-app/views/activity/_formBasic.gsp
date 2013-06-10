<%@ page import="ibmclub.Activity" %>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="activity.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="30" required="" value="${activityInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="activity.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${activityInstance.constraints.type.inList}" value="${activityInstance?.type}" valueMessagePrefix="activity.type" noSelection="['': '']"/>
</div>

<!-- <div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="activity.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="state" from="${ibmclub.ActivityState?.values()}" keys="${ibmclub.ActivityState.values()*.name()}" required="" value="${activityInstance?.state?.name()}"/>
</div> -->

<!-- <div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="activity.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${ibmclub.User.list()}" optionKey="id" required="" value="${activityInstance?.creator?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'currentCharger', 'error')} required">
	<label for="currentCharger">
		<g:message code="activity.currentCharger.label" default="Current Charger" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="currentCharger" name="currentCharger.id" from="${ibmclub.User.list()}" optionKey="id" required="" value="${activityInstance?.currentCharger?.id}" class="many-to-one"/>
</div> -->

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'mainTopic', 'error')} ">
	<label for="mainTopic">
		<g:message code="activity.mainTopic.label" default="Main Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="mainTopic" from="${activityInstance.constraints.mainTopic.inList}" value="${activityInstance?.mainTopic}" valueMessagePrefix="activity.mainTopic" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'proposedBeginDate', 'error')} required">
	<label for="proposedBeginDate">
		<g:message code="activity.proposedBeginDate.label" default="Proposed Begin Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="proposedBeginDate" precision="day"  value="${activityInstance?.proposedBeginDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'proposedEndDate', 'error')} required">
	<label for="proposedEndDate">
		<g:message code="activity.proposedEndDate.label" default="Proposed End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="proposedEndDate" precision="day"  value="${activityInstance?.proposedEndDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'coopOrg', 'error')} ">
	<label for="coopOrg">
		<g:message code="activity.coopOrg.label" default="Coop Org" />
		
	</label>
	<g:textField name="coopOrg" value="${activityInstance?.coopOrg}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'introduction', 'error')} ">
	<label for="introduction">
		<g:message code="activity.introduction.label" default="Introduction" />
		
	</label>
	<g:textArea name="introduction" cols="40" rows="5" value="${activityInstance?.introduction}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'hasAC', 'error')} ">
	<label for="hasAC">
		<g:message code="activity.hasAC.label" default="Has AC" />
		
	</label>
	<g:checkBox name="hasAC" value="${activityInstance?.hasAC}" />
</div>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="activity.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" value="${activityInstance?.note}"/>
</div>

<!-- <div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'marks', 'error')} required">
	<label for="marks">
		<g:message code="activity.marks.label" default="Marks" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="marks" from="${0..5}" class="range" required="" value="${fieldValue(bean: activityInstance, field: 'marks')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'nrStudents', 'error')} required">
	<label for="nrStudents">
		<g:message code="activity.nrStudents.label" default="Nr Students" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nrStudents" type="number" min="0" value="${activityInstance.nrStudents}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'nrNonStudents', 'error')} required">
	<label for="nrNonStudents">
		<g:message code="activity.nrNonStudents.label" default="Nr Non Students" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nrNonStudents" type="number" min="0" value="${activityInstance.nrNonStudents}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'report', 'error')} ">
	<label for="report">
		<g:message code="activity.report.label" default="Report" />
		
	</label>
	<g:textArea name="report" cols="40" rows="5" value="${activityInstance?.report}"/>
</div> -->

