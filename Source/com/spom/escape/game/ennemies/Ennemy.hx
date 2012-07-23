package com.spom.escape.game.ennemies;
import com.spom.escape.display.Entity;
import com.spom.escape.events.EnnemyEvent;

/**
 * ...
 * @author Webravenz
 */

class Ennemy extends Entity
{

	public function new() 
	{
		
		super();
		
	}
	
	private override function _update():Void {
		
		super._update();
		
		if (x < -200) {
			
			_destroy();
			
		}
		
	}
	
	private function _destroy():Void {
		
		dispatchEvent(new EnnemyEvent(EnnemyEvent.DESTROYED));
		
	}
	
}