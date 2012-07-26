package com.spom.escape.game.perso;
import com.spom.escape.data.SizeConst;
import com.spom.escape.display.Entity;

/**
 * ...
 * @author Webravenz
 */

class Balle extends Entity
{

	public function new(posX:Float, posY:Float) 
	{
		super();
		
		x = posX;
		y = posY;
		
		_collideGroup = 1;
		
		_speedX = SizeConst.SCREEN_WIDTH / 60;
		
		graphics.beginFill(0x000000);
		graphics.drawCircle(0, -100, 20);
		graphics.endFill();
		
		setHitArea(0, 0, 40, 40);
	}
	
	private override function _update():Void {
		
		super._update();
		
		if (x > SizeConst.SCREEN_WIDTH + 100) _destroy();
		
	}
	
	private override function _checkCollisions():Void {
		
		collides[0].hit(100);
		_destroy();
		
	}
	
}