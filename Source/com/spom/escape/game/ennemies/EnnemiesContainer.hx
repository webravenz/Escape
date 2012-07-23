package com.spom.escape.game.ennemies;
import com.spom.escape.display.ASprite;
import com.spom.escape.events.EnnemyEvent;

/**
 * ...
 * @author Webravenz
 */

class EnnemiesContainer extends ASprite
{
	
	private var _ennemies:Array<Ennemy>;

	public function new() 
	{
		
		super();
		
		_ennemies = new Array<Ennemy>();
		
	}
	
	private override function _onAddedToStage():Void {
		
		_addEnnemy();
		
	}
	
	public function update():Void {
		
		if (Math.random() < 0.06) {
			_addEnnemy();
		}
		
		for (ennemi in _ennemies) {
			
			ennemi.update();
			
		}
		
	}
	
	// apparition ennemi
	private function _addEnnemy() 
	{
		
		var ennemi:EnnemyBasic = new EnnemyBasic();
		addChild(ennemi);
		ennemi.addEventListener(EnnemyEvent.DESTROYED, _ennemyDestroyed);
		
		_ennemies.push(ennemi);
		
	}
	
	// suppression d'un ennemi
	private function _ennemyDestroyed(e:EnnemyEvent):Void 
	{
		
		var ennemi:Ennemy = e.currentTarget;
		
		_ennemies.remove(ennemi);
		
		removeChild(ennemi);
		ennemi = null;
		
	}
	
}