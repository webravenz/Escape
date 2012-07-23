package com.spom.escape.game.ennemies;
import com.spom.escape.display.EntitiesLayer;

/**
 * ...
 * @author Webravenz
 */

class EnnemiesGenerator
{
	
	private var _layer:EntitiesLayer;

	public function new(layer:EntitiesLayer) 
	{
		
		_layer = layer;
		
	}
	
	public function update():Void {
		
		if (Math.random() < 0.3) {
			_addEnnemy();
		}
		
	}
	
	// apparition ennemi
	private function _addEnnemy() 
	{
		
		var ennemi:EnnemyBasic = new EnnemyBasic();
		_layer.addEntity(ennemi);
		
	}
	
}