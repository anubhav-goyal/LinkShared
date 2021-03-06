package com.fintech.sharelink.credential

import commandobjects.register.UserCO
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import org.hibernate.validator.constraints.Email

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password

	String firstName
	String lastName;
	String email;
	Boolean admin;
	Boolean active;
    Date dateCreated
	Date lastUpdated

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	User(UserCO userCO,boolean saveAdmin=false){
		username = userCO.username
		password = userCO.password
		firstName = userCO.firstName
		lastName = userCO.lastName
		email = userCO.email
		active = false
		userCO.active=false
		if(saveAdmin){
			admin = true;
		}else{
			admin=false
		}


	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email blank: false
		firstName blank: false
		lastName blank: false
	}

	static mapping = {
		password column: '`password`'
	}
}
