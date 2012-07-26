package com.spom.escape.game.decor;
import com.spom.escape.data.SizeConst;
import com.spom.escape.display.Entity;
import nme.display.Bitmap;
import nme.Assets;

/**
 * ...
 * @author Webravenz
 */

class DecorTile extends Entity
{

	public function new() 
	{
		
		super();
		
		_speedX = -SizeConst.SCROLL_SPEED;
		
		var image:Bitmap = new Bitmap(Assets.getBitmapData('assets/decor/decor_1.jpg'));
		addChild(image);
		
	}
	
	public override function _update():Void {
		
		super._update();
		
		if (x < -(width + 50)) _destroy();
		
	}
	
}