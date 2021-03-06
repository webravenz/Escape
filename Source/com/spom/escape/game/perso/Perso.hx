package com.spom.escape.game.perso;

import aze.display.SparrowTilesheet;
import aze.display.TileClip;
import aze.display.TileLayer;
import com.spom.escape.data.SizeConst;
import com.spom.escape.display.Entity;
import com.spom.escape.game.Controls;
import com.spom.escape.utils.AMath;
import nme.Assets;

/**
 * ...
 * @author Webravenz
 */

class Perso extends Entity
{

	private static var _SPEEDMAX:Float;
	private static var _ACCELERATION:Float;
	
	private var _controls:Controls;
	
	public function new(controls:Controls) 
	{
		_controls = controls;
		
		_sheetName = 'perso';
		
		super();
	}
	
	private override function _onAddedToStage():Void {
		
		super._onAddedToStage();
		
		x = SizeConst.SCREEN_WIDTH / 10;
		y = SizeConst.SCREEN_HEIGHT / 2;
		
		_SPEEDMAX = SizeConst.SCREEN_HEIGHT / 75;
		_ACCELERATION = _SPEEDMAX / 10;
		
		_speedY = 0;
		_speedX = 0;
		
	}
	
	public override function _update():Void {
		
		#if flash
		// deplacement avec les fleches du clavier
		
		if (_controls.getDown())    _speedY += _ACCELERATION;
		else if (_controls.getUp()) _speedY -= _ACCELERATION;
		else                        _speedY /= 2;
		
		#else
		// deplacement touch
		
		var targetY = _controls.getTargetY();
		
		if(targetY != -1) {
			
			if (y < targetY) {
				_speedY += _ACCELERATION;
			} else if (y > targetY) {
				_speedY -= _ACCELERATION;
			}
			
			if (Math.abs(y - targetY) <= Math.abs(_speedY) * 5) _speedY /= 2;
			
			if (Math.abs(y - targetY) <= 5) _speedY = 0;
		}
		
		#end
		
		_speedY = AMath.limite(_speedY, -_SPEEDMAX, _SPEEDMAX);
		
		
		super._update();
		
		y = AMath.limite(y, SizeConst.TOP_LIM, SizeConst.BOTTOM_LIM);
		
	}
	
}