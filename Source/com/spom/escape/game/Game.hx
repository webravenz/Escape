package com.spom.escape.game;
import com.spom.escape.display.ASprite;
import com.spom.escape.game.perso.Perso;
import nme.events.Event;

/**
 * ...
 * @author Webravenz
 */

class Game extends ASprite
{
	
	private var _perso:Perso;
	private var _controls:Controls;

	public function new() 
	{
		
		super();
		
	}
	
	private override function _onAddedToStage():Void {
		
		_controls = new Controls(stage);
		_controls.start();
		
		_perso = new Perso(_controls);
		addChild(_perso);
		
		addEventListener(Event.ENTER_FRAME, _update);
		
	}
	
	private function _update(e:Event):Void 
	{
		_perso.update();
	}
	
	private override function _onRemovedFromStage():Void {
		
		removeChild(_perso);
		
		_controls.stop();
		
	}
	
}