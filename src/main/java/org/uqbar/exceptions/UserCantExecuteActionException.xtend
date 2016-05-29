package org.uqbar.exceptions

class UserCantExecuteActionException extends Exception{
	override getMessage(){
		return "The user is not the same that initiated the maze, so it can't execute that action."
	}
}