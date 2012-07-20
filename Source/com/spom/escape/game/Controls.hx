package com.spom.escape.game;
import com.spom.escape.game.perso.Perso;
import nme.display.Stage;
import nme.events.EventDispatcher;
import nme.events.KeyboardEvent;
import nme.events.TouchEvent;
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
		}
	}
	
	private function _onTouchMove(e:TouchEvent):Void 
	{
		if (e.stageX < _stage.stageWidth / 2) {
			_leftEvent(e);
		}
	}
	
	private function _onKeyDown(e:KeyboardEvent):Void 
	{
		switch(e.keyCode) {
			
			case Keyboard.Z :
				_goUp = true;
			case Keyboard.S :
				_goDown = true;
			
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
	private function _leftEvent(e:TouchEvent) 
	{
		
		_persoTargetY = e.stageY;
		
	}
	
	// start / stop
	
	public function start():Void {
		
		#if flash
		_stage.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
		_stage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		#else
		_stage.addEventListener(TouchEvent.TOUCH_BEGIN, _onTouchStart);
		_stage.addEventListener(TouchEvent.TOUCH_MOVE, _onTouchMove);
		#end
		
	}
	
	public function stop():Void {
		
		#if flash
		
		#else
		_stage.removeEventListener(TouchEvent.TOUCH_BEGIN, _onTouchStart);
		_stage.removeEventListener(TouchEvent.TOUCH_MOVE, _onTouchMove);
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