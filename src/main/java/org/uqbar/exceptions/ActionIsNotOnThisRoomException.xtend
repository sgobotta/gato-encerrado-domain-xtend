package org.uqbar.exceptions

class ActionIsNotOnThisRoomException extends Exception {
	override getMessage(){
		return "The action selected doesn't belong to your current room."
	}
}