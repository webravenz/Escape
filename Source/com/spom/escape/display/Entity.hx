package com.spom.escape.display;
import aze.display.SparrowTilesheet;
import aze.display.TileClip;
import aze.display.TileLayer;
import com.spom.escape.data.Sheets;
import com.spom.escape.data.SizeConst;
import com.spom.escape.events.EntityEvent;
import nme.display.Sprite;
import nme.geom.Rectangle;

/**
 * ...
 * @author Webravenz
 */

class Entity extends ASprite
{
	
	private var _speedX:Float = 0;
	private var _speedY:Float = 0;
	
	private var _displayed:Bool = false;
	public var hasMoved:Bool = false;
	private var _life:Int = 100;
	
	// animation
	private var _fps:Int = 8;
	private var _currentAnim:String = '';
	private var _sheetName:String;
	private var _sheetLayer:TileLayer;
	private var _sheetClip:TileClip;
	
	// ocllisions
	private var _collideGroup:Int = 0;
	public var collides:Array<Entity> = null;
	private var _area:Rectangle;
	
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
	
	// update call each frame
	public function update():Void {
		
		if (_displayed) {
			_update();
		}
		
	}
	
	private function _update():Void {
		
		x += _speedX;
		y += _speedY;
		
		if(_sheetLayer != null) _sheetLayer.render();
		
		if (_speedY != 0) hasMoved = true;
		
	}
	
	// check collisions with other entities
	public function checkCollisions():Void {
		
		if (_collideGroup != 0 && collides != null && collides.length > 0) {
			
			_checkCollisions();
			
		}
		
	}
	
	private function _checkCollisions():Void
	{
		
	}
	
	private function _destroy():Void {
		
		dispatchEvent(new EntityEvent(EntityEvent.DESTROYED));
		
	}
	
	// lose life, if 0 you're dead bastard
	public function hit(power:Int):Void {
		
		_life -= power;
		
		if (_life <= 0) {
			
			_collideGroup = 0;
			_destroy();
			
		}
		
	}
	
	// set collide area
	private function setHitArea(ax:Float, ay:Float, aw:Int, ah:Int):Void {
		
		_area = new Rectangle(ax * SizeConst.SCALE, ay * SizeConst.SCALE, aw * SizeConst.SCALE, ah * SizeConst.SCALE);
		
	}
	
	// getters
	
	public function getCollideGroup():Int {
		return _collideGroup;
	}
	
	public function getArea():Rectangle {
		return new Rectangle(x + _area.x, y + _area.y, _area.width, _area.height);
	}
	
}