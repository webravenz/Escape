package com.spom.escape.display;
import aze.display.SparrowTilesheet;
import aze.display.TileClip;
import aze.display.TileLayer;
import com.spom.escape.data.Sheets;

/**
 * ...
 * @author Webravenz
 */

class Entity extends ASprite
{
	
	private var _speedX:Float;
	private var _speedY:Float;
	
	private var _fps:Int = 8;
	private var _currentAnim:String = '';
	
	private var _sheetName:String;
	private var _sheetLayer:TileLayer;
	private var _sheetClip:TileClip;
	
	public function new() 
	{
		super();
		
		if (_sheetName != null) _initClip();
	}
	
	private function _initClip():Void {
		
		var sheet:SparrowTilesheet = Sheets.getSheet(_sheetName);
		
		if (sheet != null) {
			
			_sheetLayer = new TileLayer(sheet);
			var clip = new TileClip(_currentAnim, _fps);
			_sheetLayer.addChild(clip);
			
			addChild(_sheetLayer.view);
			
		}
		
	}
	
	public function update():Void {
		
		x += _speedX;
		y += _speedY;
		
		_sheetLayer.render();
		
	}
	
}