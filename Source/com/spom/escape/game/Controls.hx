package com.spom.escape.game;
import com.spom.escape.events.ControlEvent;
import com.spom.escape.game.perso.Perso;
import nme.display.Stage;
import nme.events.EventDispatcher;
import nme.events.KeyboardEvent;
import nme.events.TouchEvent;
import nme.geom.Point;
import nme.ui.Keyboard;

/**
 * ...
 * @author Webravenz
 */

class Controls extends EventDispatcher
{
	
	private var _stage:Stage;
	
	// touch
	private var _persoTargetY:Float = -1;
	private var _rightStartPoint:Point;
	
	// keyboard
	private var _goUp:Bool = false;
	private var _goDown:Bool = false;

	public function new(stage:Stage) 
	{
		super();
		
		_stage = stage;
		
	}
	
	// event listeners
	
	private function _onTouchStart(e:TouchEvent):Void 
	{
		if (e.stageX < _stage.stageWidth / 2) {
			_leftEvent(e);
		} else {
			_rightStart(e);
		}
	}
	
	private function _onTouchMove(e:TouchEvent):Void 
	{
		if (e.stageX < _stage.stageWidth / 2) {
			_leftEvent(e);
		} else {
			
		}
	}
	
	private function _onTouchEnd(e:TouchEvent):Void 
	{
		if (e.stageX < _stage.stageWidth / 2) {
			
		} else {
			_rightEnd(e);
		}
	}
	
	private function _onKeyDown(e:KeyboardEvent):Void 
	{
		switch(e.keyCode) {
			
			case Keyboard.Z :
				_goUp = true;
			case Keyboard.S :
				_goDown = true;
			case Keyboard.J :
				_shoot();
			
		}
	}
	
	private function _onKeyUp(e:KeyboardEvent):Void 
	{
		switch(e.keyCode) {
			
			case Keyboard.Z :
				_goUp = false;
			case Keyboard.S :
				_goDown = false;
			
		}
		
	}
	
	// events gestion
	
	// doit gauche : deplacement perso
	private function _leftEvent(e:TouchEvent):Void
	{
		
		_persoTargetY = e.stageY;
		
	}
	
	// pouce droit start
	private function _rightStart(e:TouchEvent):Void
	{
		_rightStartPoint = new Point(e.stageX, e.stageY);
	}
	
	// pouce droit end
	private function _rightEnd(e:TouchEvent):Void
	{
		if (_rightStartPoint != null) {
			
			_shoot();
			
		}
	}
	
	// tap a droite : shoot
	private function _shoot():Void {
		
		dispatchEvent(new ControlEvent(ControlEvent.SHOOT));
		
	}
	
	// start / stop
	
	public function start():Void {
		
		#if flash
		_stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
		_stage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		#else
		_stage.addEventListener(TouchEvent.TOUCH_BEGIN, _onTouchStart);
		_stage.addEventListener(TouchEvent.TOUCH_MOVE, _onTouchMove);
		_stage.addEventListener(TouchEvent.TOUCH_END, _onTouchEnd);
		#end
		
	}
	
	public function stop():Void {
		
		#if flash
		
		#else
		_stage.removeEventListener(TouchEvent.TOUCH_BEGIN, _onTouchStart);
		_stage.removeEventListener(TouchEvent.TOUCH_MOVE, _onTouchMove);
		_stage.removeEventListener(TouchEvent.TOUCH_END, _onTouchEnd);
		#end
		
	}
	
	// getters / setters
	
	public function getTargetY():Float {
		return _persoTargetY;
	}
	
	public function getUp():Bool {
		return _goUp;
	}
	
	public function getDown():Bool {
		return _goDown;
	}
	
}