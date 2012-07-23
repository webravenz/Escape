package com.spom.escape.display;
import aze.display.SparrowTilesheet;
import aze.display.TileClip;
import aze.display.TileLayer;
import com.spom.escape.data.Sheets;
import com.spom.escape.data.SizeConst;
import com.spom.escape.events.EntityEvent;

/**
 * ...
 * @author Webravenz
 */

class Entity extends ASprite
{
	
	private var _speedX:Float = 0;
	private var _speedY:Float = 0;
	
	private var _fps:Int = 8;
	private var _currentAnim:String = '';
	
	private var _sheetName:String;
	private var _sheetLayer:TileLayer;
	private var _sheetClip:TileClip;
	
	private var _displayed:Bool = false;
	public var hasMoved:Bool = false;
	
	public function new() 
	{
		super();
		
	}
	
	private override function _onAddedToStage():Void {
		
		scaleX = scaleY = SizeConst.SCALE;
		
		if (_sheetName != null) _initClip();
		
		_displayed = true;
		
	}
	
	private override function _onRemovedFromStage():Void {
		
		_displayed = false;
		
	}
	
	private function _initClip():Void {
		
		var sheet:SparrowTilesheet = Sheets.getSheet(_sheetName);
		
		if (sheet != null) {
			
			_sheetLayer = new TileLayer(sheet);
			var clip = new TileClip(_currentAnim, _fps);
			_sheetLayer.addChild(clip);
			
			addChild(_sheetLayer.view);
			_sheetLayer.view.y = -clip.height / 2;
			
		}
		
	}
	
	public function update():Void {
		
		if (_displayed) {
			_update();
		}
		
	}
	
	private function _update():Void {
		
		x += _speedX;
		y += _speedY;
		
		_sheetLayer.render();
		
		if (_speedY != 0) hasMoved = true;
		
	}
	
	private function _destroy():Void {
		
		dispatchEvent(new EntityEvent(EntityEvent.DESTROYED));
		
	}
	
}