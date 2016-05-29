package org.uqbar.exceptions

class PlayerIsNotOnThisRoomException extends Exception{
	override getMessage(){
		return "The room selected is not your current room."
	}
}