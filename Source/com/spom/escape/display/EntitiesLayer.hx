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
			
			if(entity.getCollideGroup() == 1) {
				_checkCollisions(entity);
				
				entity.checkCollisions();
			}
			
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
	
	// ajout d'une entite dans le calque
	public function addEntity(entity:Entity):Void
	{
		
		addChild(entity);
		_replace(entity);
		entity.addEventListener(EntityEvent.DESTROYED, _entityDestroyed);
		
		_entities.push(entity);
		
	}
	
	// suppression d'une entite
	private function _entityDestroyed(e:EntityEvent):Void 
	{
		
		var entity:Entity = e.currentTarget;
		
		_entities.remove(entity);
		
		removeChild(entity);
		entity = null;
		
	}
	
	// verif des collisions sur une entite
	private function _checkCollisions(entity:Entity):Void {
		
		if (entity.getCollideGroup() != 0) {
			
			entity.collides = new Array<Entity>();
			
			// verif sur toutes les entites, qui ne sont pas du meme groupe et qui n'ont pas encore été testées
			for (entityCheck in _entities) {
				
				if (entityCheck.getCollideGroup() != 0 && entity.getCollideGroup() != entityCheck.getCollideGroup()) {
					
					if (entity.getArea().intersects(entityCheck.getArea())) {
						entity.collides.push(entityCheck);
					}
					
				}
				
			}
		}
		
	}
	
}