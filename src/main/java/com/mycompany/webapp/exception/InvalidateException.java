package com.mycompany.webapp.exception;

public class InvalidateException extends RuntimeException{
	public InvalidateException() {
		super("Invalidate");
	}
	
	public InvalidateException(String message) {
		super(message);
	}
}
