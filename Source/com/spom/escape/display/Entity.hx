package com.spom.escape.display;

/**
 * ...
 * @author Webravenz
 */

class Entity extends ASprite
{
	
	private var _speedX:Float;
	private var _speedY:Float;

	public function new() 
	{
		super();
	}
	
	public function update():Void {
		
		x += _speedX;
		y += _speedY;
		
	}
	
}