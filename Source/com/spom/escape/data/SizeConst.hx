package com.spom.escape.data;
import nme.display.Stage;

/**
 * ...
 * @author Webravenz
 */

class SizeConst 
{
	
	public static var SCREEN_WIDTH:Int;
	public static var SCREEN_HEIGHT:Int;
	public static var SCALE:Float;
	public static var BOTTOM_LIM:Float;
	public static var TOP_LIM:Float;
	public static var SCROLL_SPEED:Float;

	public function new() 
	{
		
	}
	
	public static function init(stage:Stage):Void {
		
		if (stage.stageWidth > stage.stageHeight) {
			SCREEN_WIDTH = stage.stageWidth;
			SCREEN_HEIGHT = stage.stageHeight;
		} else {
			SCREEN_WIDTH = stage.stageHeight;
			SCREEN_HEIGHT = stage.stageWidth;
		}
		
		SCALE = SCREEN_HEIGHT / 1500;
		
		BOTTOM_LIM = SCREEN_HEIGHT * 0.9;
		TOP_LIM = SCREEN_HEIGHT * 0.3;
		
		SCROLL_SPEED = Math.round(SCREEN_WIDTH / 200);
		
	}
	
}