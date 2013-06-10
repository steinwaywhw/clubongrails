package ibmclub

class User {

    // basic part
	String email
    Boolean isEmailVerified = false

	String password
    String gravatarAccount = ""

	String realName
	UserRole role
    UserState state = UserState.ACTIVE
	String introduction = ""
	String phone = ""

    // club member part
    Domain domain

    // club/area/super admin part
    Domain chargedDomain

    // ac admin part
    Area chargedArea

    // ac member part
    String division = ""
    String position = ""
    String gender
    List<UserGradInfo> gradInfo

    String toString () {
        return realName + " (" + email + ")"
    }

    static constraints = {
    	realName blank: false, maxSize: 20
    	email blank: false, email: true, unique: true
    	password password: true, size: 6..30
        gravatarAccount blank: true, email: true
    	role ()
    	introduction blank: true, maxSize: 140, widget: 'textarea'
    	phone blank: true, maxSize: 50
        state ()

        chargedDomain nullable: true
        chargedArea nullable: true
        domain nullable: true

        division blank: true, maxSize: 30
        position blank: true, maxSize: 30
        gender nullable: true, blank: false, inList: ["男", "女"], validator: {val, obj ->
            if (val == null && (obj.role == UserRole.ACMEMBER || obj.role == UserRole.ACADMIN))
                return false
            else 
                return true
        }

        importFrom UserGradInfo
    }
}

class UserGradInfo {
    String school = ""
    Date gradYear = ""
    String major = ""
    String type = ""

    static constratins = {
        school maxSize: 50
        gradYear ()
        major maxSize: 50
        type inList: ["本科", "硕士", "博士"]
    }
}

enum UserState {
    INACTIVE ("未激活"),
    ACTIVE ("正常"),
    DELETED ("已删除")

    String display

    UserState (String display) {
        this.display = display
    }

    String toString () {
        return display
    }
}

enum UserRole {
    ACMEMBER ("校友俱乐部会员"), 
    ACADMIN ("校友俱乐部主席"), 
    CLUBDOMAIN ("俱乐部管理员"), 
    AREADOMAIN ("地区管理员"), 
    SA ("管理员"), 
    CLUBMEMBER ("俱乐部会员")

    String display

    UserRole (String display) {
        this.display = display
    }

    String toString () {
        return display
    }
}
