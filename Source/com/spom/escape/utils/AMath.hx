package com.spom.escape.utils;

/**
 * ...
 * @author Webravenz
 */

class AMath 
{
	
	public static function limite(val:Float, min:Float, max:Float):Float {
		
		return val < min ? min : val > max ? max : val;
		
	}
	
}