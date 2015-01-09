package;

import phaser.plugin.isometric.IsoSprite;
import phaser.core.Game;

class MyIsoSprite extends IsoSprite
{

	public var oldZ:Float;
	
	public function new (game:Game, x:Float, y:Float, z:Float, key:Dynamic, frame:Dynamic) {
		
		super (game, x, y, z, key, frame);
		anchor.set(0.5);
		
	}
	
}