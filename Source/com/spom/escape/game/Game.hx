package com.spom.escape.game;
import com.spom.escape.data.Sheets;
import com.spom.escape.display.ASprite;
import com.spom.escape.display.EntitiesLayer;
import com.spom.escape.game.ennemies.EnnemiesGenerator;
import com.spom.escape.game.perso.Perso;
import com.spom.escape.game.perso.SkillsManager;
import nme.events.Event;

/**
 * ...
 * @author Webravenz
 */

class Game extends ASprite
{
	
	private var _perso:Perso;
	private var _ennemies:EnnemiesGenerator;
	private var _controls:Controls;
	private var _skillsManager:SkillsManager;
	private var _sheetsToLoad:Array<Dynamic>;
	
	private var _layerObjects:EntitiesLayer;

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
		
		_layerObjects = new EntitiesLayer();
		addChild(_layerObjects);
		
		// gestion des touches, du touch
		_controls = new Controls(stage);
		_controls.start();
		
		// personnage
		_perso = new Perso(_controls);
		_layerObjects.addEntity(_perso);
		
		// skills
		_skillsManager = new SkillsManager(_controls, _perso, _layerObjects);
		_skillsManager.start();
		
		// ennemis
		_ennemies = new EnnemiesGenerator(_layerObjects);
		
		// boucle de rendu
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
		_layerObjects.update();
		_ennemies.update();
	}
	
	private override function _onRemovedFromStage():Void {
		
		_controls.stop();
		_skillsManager.stop();
		
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