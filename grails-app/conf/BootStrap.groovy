import ibmclub.*

class BootStrap {

    def init = { servletContext ->
    	environments {
	        production {

	        }
	        development {

	        	def area = new Area(name: "上海地区").save()
	        	def superDomain = new Domain(name: "全国域", type: DomainType.SUPERDOMAIN).save()
	        	def areaDomain = new Domain(name: "华东域", type: DomainType.AREADOMAIN, parent: superDomain).save()
	        	def clubDomain = new Domain(name: "同济", type: DomainType.CLUBDOMAIN, parent: areaDomain, area: area).save()
	        	def sa = new User (
	        		email: "super@admin.com",
	        		password: "123456",
	        		realName: "Super Administrator",
	        		role: UserRole.SA,
	        		chargedDomain: superDomain,
	        		).save()
	        	superDomain.admin = sa
	        	superDomain.save()

	        	def areaAdmin = new User (
	        		email: "area@admin.com",
	        		password: "123456",
	        		realName: "Area Administrator",
	        		role: UserRole.AREADOMAIN,
	        		chargedDomain: areaDomain
	        		).save()
	        	areaDomain.admin = areaAdmin
	        	areaDomain.save()

	        	def clubAdmin = new User (
	        		email: "club@admin.com",
	        		password: "123456",
	        		realName: "Club Administrator",
	        		role: UserRole.CLUBDOMAIN,
	        		chargedDomain: clubDomain
	        		).save()
	        	clubDomain.admin = clubAdmin
	        	clubDomain.save()

	        	def acAdmin = new User (
	        		email: "ac@admin.com",
	        		password: "123456",
	        		realName: "AC Administrator",
	        		role: UserRole.ACADMIN,
	        		chargedArea: area,
	        		gender: "男"
	        		).save()
	        	area.admin = acAdmin
	        	area.save()
	        }
    	}
	}	
    def destroy = {
    }
}
