package com.spom.escape.game;
import com.spom.escape.data.Sheets;
import com.spom.escape.display.ASprite;
import com.spom.escape.game.ennemies.EnnemiesContainer;
import com.spom.escape.game.perso.Perso;
import nme.events.Event;

/**
 * ...
 * @author Webravenz
 */

class Game extends ASprite
{
	
	private var _perso:Perso;
	private var _ennemies:EnnemiesContainer;
	private var _controls:Controls;
	private var _sheetsToLoad:Array<Dynamic>;

	public function new() 
	{
		
		_sheetsToLoad = [
			{ folder: 'perso', name: 'perso' },
			{ folder: 'ennemies', name: 'basic' }
		];
		
		super();
		
	}
	
	private override function _onAddedToStage():Void {
		
		_loadSheets();
		
		// gestion des touches, du touch
		_controls = new Controls(stage);
		_controls.start();
		
		// personnage
		_perso = new Perso(_controls);
		addChild(_perso);
		
		// ennemis
		_ennemies = new EnnemiesContainer();
		addChild(_ennemies);
		
		addEventListener(Event.ENTER_FRAME, _update);
		
	}
	
	// load all the sprite sheets needed for the game
	private function _loadSheets() 
	{
		for (sheetInfos in _sheetsToLoad) {
			
			Sheets.loadSheet(sheetInfos.folder, sheetInfos.name);
			
		}
		
	}
	
	// update all entites each frame
	private function _update(e:Event):Void 
	{
		_perso.update();
		_ennemies.update();
	}
	
	private override function _onRemovedFromStage():Void {
		
		removeChild(_perso);
		
		_controls.stop();
		
		_removeSheets();
		
	}
	
	// remove all the sprite sheets needed for the game
	private function _removeSheets() 
	{
		for (sheetInfos in _sheetsToLoad) {
			
			Sheets.removeSheet(sheetInfos.name);
			
		}
		
	}
	
}