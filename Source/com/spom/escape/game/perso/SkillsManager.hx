package com.spom.escape.game.perso;
import com.spom.escape.display.EntitiesLayer;
import com.spom.escape.events.ControlEvent;
import com.spom.escape.game.Controls;

/**
 * ...
 * @author Webravenz
 */

class SkillsManager 
{
	
	private var _controls:Controls;
	private var _perso:Perso;
	private var _layer:EntitiesLayer;

	public function new(controls:Controls, perso:Perso, layer:EntitiesLayer) 
	{
		_controls = controls;
		_perso = perso;
		_layer = layer;
	}
	
	public function start() {
		
		_controls.addEventListener(ControlEvent.SHOOT, _onShoot);
		
	}
	
	public function stop() {
		
		_controls.removeEventListener(ControlEvent.SHOOT, _onShoot);
		
	}
	
	private function _onShoot(e:ControlEvent):Void 
	{
		
		_layer.addEntity(new Balle(_perso.x, _perso.y));
		
	}
	
	
}