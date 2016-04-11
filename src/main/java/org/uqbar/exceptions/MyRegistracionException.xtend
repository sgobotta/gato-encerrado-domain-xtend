package org.uqbar.exceptions

import org.uqbar.commons.model.UserException

class MyRegistracionException extends UserException{
	new(String msg){
		super(msg)
	}
}