package com.spom.escape.game.ennemies;
import com.spom.escape.display.Entity;

/**
 * ...
 * @author Webravenz
 */

class Ennemy extends Entity
{
	

	public function new() 
	{
		
		super();
		
		_collideGroup = 2;
		
	}
	
	private override function _update():Void {
		
		super._update();
		
		if (x < -200) {
			
			_destroy();
			
		}
		
	}
	
}