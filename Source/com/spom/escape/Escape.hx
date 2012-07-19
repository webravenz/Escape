package com.spom.escape;


import com.spom.escape.game.Game;
import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;


/**
 * @author Webravenz
 */
class Escape extends Sprite {
	
	
	public function new () {
		
		super ();
		
		initialize ();
		
		
		
	}
	
	
	private function initialize ():Void {
		
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.stage.frameRate = 60;
		
		var game:Game = new Game();
		addChild(game);
	}
	
	
	
	
	// Entry point
	
	
	
	
	public static function main () {
		
		Lib.current.addChild (new Escape ());
		
	}
	
	
}