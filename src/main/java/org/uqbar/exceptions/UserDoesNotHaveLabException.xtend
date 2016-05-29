package org.uqbar.exceptions

class UserDoesNotHaveLabException extends Exception {
	override getMessage(){
		return "That user doesn't own that maze."
	}
}