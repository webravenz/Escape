package com.spom.escape.display;
import com.spom.escape.events.EntityEvent;

/**
 * ...
 * @author Webravenz
 */

class EntitiesLayer extends ASprite
{
	
	private var _entities:Array<Entity>;
	private var _replaceCount:Int = 10;

	public function new() 
	{
		
		super();
		
		_entities = new Array<Entity>();
		
	}
	
	public function update():Void {
		
		for (entity in _entities) {
			
			entity.update();
			
			if (_replaceCount == 0 && entity.hasMoved) _replace(entity);
			entity.hasMoved = false;
			
		}
		
		if (_replaceCount == 0) _replaceCount = 10;
		_replaceCount--;
		
	}
	
	// repositionne une entite en fonction de sa position y
	private function _replace(entity:Entity):Void
	{
		
		var countTop:Int = 0;
		
		for (entityOther in _entities) {
			
			if (entityOther.y < entity.y) {
				countTop++;
			}
			
		}
		
		addChildAt(entity, countTop);
		
	}
	
	public function addEntity(entity:Entity):Void
	{
		
		addChild(entity);
		_replace(entity);
		entity.addEventListener(EntityEvent.DESTROYED, _entityDestroyed);
		
		_entities.push(entity);
		
	}
	
	// suppression d'un ennemi
	private function _entityDestroyed(e:EntityEvent):Void 
	{
		
		var entity:Entity = e.currentTarget;
		
		_entities.remove(entity);
		
		removeChild(entity);
		entity = null;
		
	}
	
}