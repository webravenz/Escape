package com.spom.escape.display;
import nme.display.Sprite;
import nme.events.Event;

/**
 * ...
 * @author Webravenz
 */

class ASprite extends Sprite
{

	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, _addedToStage);
		addEventListener(Event.REMOVED_FROM_STAGE, _removedFromStage);
	}
	
	private function _addedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, _addedToStage);
		
		_onAddedToStage();
	}
	
	private function _removedFromStage(e:Event):Void 
	{
		removeEventListener(Event.REMOVED_FROM_STAGE, _removedFromStage);
		
		_onRemovedFromStage();
	}
	
	private function _onAddedToStage():Void {
		
	}
	
	private function _onRemovedFromStage():Void
	{
		
	}
	
}