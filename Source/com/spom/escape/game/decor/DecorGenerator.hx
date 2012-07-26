package com.spom.escape.game.decor;
import com.spom.escape.data.SizeConst;
import com.spom.escape.display.EntitiesLayer;

/**
 * ...
 * @author Webravenz
 */

class DecorGenerator extends EntitiesLayer
{
	
	private var _lastTile:DecorTile;

	public function new() 
	{
		
		super();
		
		var nextPos:Float = 0;
		
		while (nextPos < SizeConst.SCREEN_WIDTH) {
			
			createTile(nextPos);
			
			nextPos = _lastTile.x + _lastTile.width;
			
		}
		
	}
	
	public override function update():Void {
		
		if (_lastTile != null) {
			
			var tilePos:Float = _lastTile.x + _lastTile.width;
			
			if (tilePos <= SizeConst.SCREEN_WIDTH) {
				createTile(tilePos);
			}
			
		} else {
			
			createTile(SizeConst.SCREEN_WIDTH);
			
		}
		
		super.update();
		
	}
	
	private function createTile(pos:Float):Void {
		
		var tile:DecorTile = new DecorTile();
		tile.x = pos;
		addEntity(tile);
		
		_lastTile = tile;
		
	}
	
}