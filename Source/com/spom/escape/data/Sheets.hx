package com.spom.escape.data;
import aze.display.SparrowTilesheet;
import nme.Assets;

/**
 * ...
 * @author Webravenz
 */

class Sheets 
{
	
	static var sheets:Hash<SparrowTilesheet> = new Hash<SparrowTilesheet>();
	
	public static function loadSheet(folder:String, name:String):Void {
		
		if (!sheets.exists(name)) {
			
			var tilesheet = new SparrowTilesheet(
				Assets.getBitmapData('assets/sheets/' + folder + '/' + name + '.png'), Assets.getText('assets/sheets/' + folder + '/' + name + '.xml'));
			
			sheets.set(name, tilesheet);
			
		}
		
	}
	
	public static function removeSheet(name:String):Void {
		
		sheets.remove(name);
		
	}
	
	public static function getSheet(name:String):SparrowTilesheet {
		
		return sheets.get(name);
		
	}
	
}