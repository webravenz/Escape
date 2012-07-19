package com.spom.escape.game.perso;

import com.spom.escape.display.ASprite;
import com.spom.escape.utils.AMath;

/**
 * ...
 * @author Webravenz
 */

class Perso extends ASprite
{

	private static var _SPEEDMAX:Int = 5;
	private static var _ACCELERATION:Float = 0.5;
	
	private var _targetY:Float;
	private var _speed:Float = 0;
	
	public function new() 
	{
		super();
	}
	
	private override function _onAddedToStage():Void {
		
		graphics.beginFill(0xFF0000);
		graphics.drawRect( -30, -40, 60, 80);
		graphics.endFill();
		
		x = 80;
		y = 200;
		_targetY = y;
		
	}
	
	public function update():Void {
		
		if (y < _targetY) {
			_speed += _ACCELERATION;
		} else if (y > _targetY) {
			_speed -= _ACCELERATION;
		}
		
		_speed = AMath.limite(_speed, -_SPEEDMAX, _SPEEDMAX);
		
		if (Math.abs(y - _targetY) <= Math.abs(_speed) * 3) _speed /= 2;
		
		if (Math.abs(y - _targetY) <= 5) _speed = 0;
		
		y += _speed;
		
	}
	
	public function setTargetY(target:Float):Void {
		
		_targetY = target;
		
	}
	
}