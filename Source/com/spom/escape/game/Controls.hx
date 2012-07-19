package com.spom.escape.game;
import com.spom.escape.game.perso.Perso;
import nme.display.Stage;
import nme.events.EventDispatcher;
import nme.events.TouchEvent;

/**
 * ...
 * @author Webravenz
 */

class Controls extends EventDispatcher
{
	
	private var _stage:Stage;
	private var _perso:Perso;

	public function new(stage:Stage, perso:Perso) 
	{
		super();
		
		_stage = stage;
		_perso = perso;
		
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
	
	// events gestion
	
	// doit gauche : deplacement perso
	private function _leftEvent(e:TouchEvent) 
	{
		
		_perso.setTargetY(e.stageY);
		
	}
	
	// start / stop
	
	public function start():Void {
		
		_stage.addEventListener(TouchEvent.TOUCH_BEGIN, _onTouchStart);
		_stage.addEventListener(TouchEvent.TOUCH_MOVE, _onTouchMove);
		
	}
	
	public function stop():Void {
		
		_stage.removeEventListener(TouchEvent.TOUCH_BEGIN, _onTouchStart);
		_stage.removeEventListener(TouchEvent.TOUCH_MOVE, _onTouchMove);
		
	}
	
}