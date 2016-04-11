package org.uqbar.exceptions

import org.uqbar.commons.model.UserException

class MyEliminandoUsuarioException extends UserException{
	new(String msg){
		super(msg)
	}
}