package com.spom.escape.game.ennemies;
import com.spom.escape.data.SizeConst;
import com.spom.escape.utils.AMath;

/**
 * ...
 * @author Webravenz
 */

class EnnemyBasic extends Ennemy
{

	public function new() 
	{
		
		super();
		
		_sheetName = 'basic';
		_fps = 15;
		
		_speedX = -SizeConst.SCROLL_SPEED * 2;
		
		setHitArea(20, 20, 140, 150);
		
	}
	
	private override function _onAddedToStage():Void {
		
		super._onAddedToStage();
		
		x = SizeConst.SCREEN_WIDTH * 1.1;
		y = AMath.random(SizeConst.TOP_LIM, SizeConst.BOTTOM_LIM);
		
		scaleX *= -1;
		
	}
	
}