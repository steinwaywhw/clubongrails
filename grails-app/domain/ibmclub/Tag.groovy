package ibmclub

class Tag {

	String name

	Tag (String name) {
		this.name = name.tr('A-Z', 'a-z')
	}

    static constraints = {
    	name maxSize: 30, unique: true
    }

    String toString () {
    	return name
    }
}
