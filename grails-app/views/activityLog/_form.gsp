<%@ page import="ibmclub.ActivityLog" %>



<div class="fieldcontain ${hasErrors(bean: activityLogInstance, field: 'activity', 'error')} required">
	<label for="activity">
		<g:message code="activityLog.activity.label" default="Activity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="activity" name="activity.id" from="${ibmclub.Activity.list()}" optionKey="id" required="" value="${activityLogInstance?.activity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityLogInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="activityLog.note.label" default="Note" />
		
	</label>
	<g:textField name="note" maxlength="100" value="${activityLogInstance?.note}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityLogInstance, field: 'prevCharger', 'error')} ">
	<label for="prevCharger">
		<g:message code="activityLog.prevCharger.label" default="Prev Charger" />
		
	</label>
	<g:select id="prevCharger" name="prevCharger.id" from="${ibmclub.User.list()}" optionKey="id" value="${activityLogInstance?.prevCharger?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityLogInstance, field: 'nextCharger', 'error')} ">
	<label for="nextCharger">
		<g:message code="activityLog.nextCharger.label" default="Next Charger" />
		
	</label>
	<g:select id="nextCharger" name="nextCharger.id" from="${ibmclub.User.list()}" optionKey="id" value="${activityLogInstance?.nextCharger?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

