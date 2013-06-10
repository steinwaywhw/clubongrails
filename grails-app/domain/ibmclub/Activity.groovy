package ibmclub

class Activity {

	// basic info
	Date proposedBeginDate = new Date()
	Date proposedEndDate = new Date() + 3
	String coopOrg
	String introduction
	String mainTopic
	ActivityState state
	String title
	String type
	String note
	Boolean hasAC
	User creator

	// charger info
	User currentCharger

	// report info
    Integer marks = 3
	Integer nrStudents = 0
	Integer nrNonStudents = 0
	String report = ""

	static hasMany = [tags: Tag, logs: ActivityLog, applicants: ActivityApplicant]

	static constraints = {
		title blank: false, maxSize: 30
		type blank: false, inList: [
			"校园宣讲", "技术讲座", 
			"技术培训", "文化之旅", 
			"职业发展", "经验分享", 
			"实习招聘", "竞赛宣传", 
			"团队建设", "其他"	]

		state editable: false
		creator editable: false
		currentCharger editable: false

		mainTopic blank: false, inList: [
			"职业发展", 
			"交流技巧", 
			"企业文化", 
			"BAO", 
			"Blade Servers", 
			"Blue Gene", 
			"Cloud Computing", 
			"Cluster Systems", 
			"Industry Solution", 
			"Info Management", 
			"IOT", 
			"Lotus", 
			"Networking", 
			"Open Source", 
			"Power Systems", 
			"Rational", 
			"Smart Cubes", 
			"SOA", 
			"Storage", 
			"System x", 
			"System z", 
			"Tivoli", 
			"Websphere", 
			"其他"]
		proposedBeginDate blank: false, validator: {val, obj -> 
			return val.clearTime() >= new Date().clearTime()
		}
		proposedEndDate blank: false, validator: {val, obj -> 
			return val.clearTime() >= obj.proposedBeginDate.clearTime() && val.clearTime() >= new Date().clearTime()
		}

		introduction widget: 'textarea'
		hasAC ()
		coopOrg blank: true
		note blank: true, widget: 'textarea'

		marks range: 0..5 
		nrStudents min: 0
		nrNonStudents min: 0
		report blank: true, widget: 'textarea'

		logs nullable: true
		tags nullable: true
		applicants nullable: true
    }
}

enum ActivityState {
	TO_BE_PROCESSED ("待处理"),	
	AC_MEMBER_APPLYING ("校友俱乐部会员申请中"),	
	AC_MEMBER_ASSIGNING ("校友俱乐部会员指派中"),	
	AC_MEMBER_CONFIRMING ("校友俱乐部会员确认中"),	
	AREA_DOMAIN_AUDITING ("地区域管理员审核中"),	
	CLOSED ("已关闭"),	
	REPORT_PENDING ("等待报告和反馈"),	
	REPORT_AUDITING ("报告审核中"),	
	REPORT_PASSED ("报告审核通过"),	
	DELETED ("已删除")

	String name

	ActivityState (String name) {
		this.name = name
	}

	String toString () {
		return name
	}
}