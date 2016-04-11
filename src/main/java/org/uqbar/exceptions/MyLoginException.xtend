package org.uqbar.exceptions

import org.uqbar.commons.model.UserException

class MyLoginException extends UserException{
	new(String msg){
		super(msg)
	}
}