package phaser.plugin.isometric;

import phaser.gameobjects.Sprite;
import phaser.core.Game;
import phaser.gameobjects.GameObjectCreator;
import phaser.gameobjects.GameObjectFactory;
import phaser.utils.Debug;
import phaser.core.Group;

@:native("Phaser.Plugin.Isometric.IsoSprite")
extern class IsoSprite extends Sprite {
	/**
	* Create a new `IsoSprite` object. IsoSprites are extended versions of standard Sprites that are suitable for axonometric positioning.
	*
	* IsoSprites are simply Sprites that have three new position properties (isoX, isoY and isoZ) and ask the instance of Phaser.Plugin.Isometric.Projector what their position should be in a 2D scene whenever these properties are changed.
	* The IsoSprites retain their 2D position property to prevent any problems and allow you to interact with them as you would a normal Sprite. The upside of this simplicity is that things should behave predictably for those already used to Phaser.
	* 
	* @param game - A reference to the currently running game.
	* @param x - The x coordinate (in 3D space) to position the IsoSprite at.
	* @param y - The y coordinate (in 3D space) to position the IsoSprite at.
	* @param z - The z coordinate (in 3D space) to position the IsoSprite at.
	* @param key - This is the image or texture used by the IsoSprite during rendering. It can be a string which is a reference to the Cache entry, or an instance of a RenderTexture or PIXI.Texture.
	* @param frame - If this IsoSprite is using part of a sprite sheet or texture atlas you can specify the exact frame to use by giving a string or numeric index.
	 */
	function new (game:Game, x:Float, y:Float, z:Float, key:Dynamic, frame:Dynamic);
	
    /**
     * Snap this IsoSprite's position to the specified value; handy for keeping pixel art snapped to whole pixels.
     */
    var snap:Float;
	
	/**
	 * The axonometric position of the IsoSprite on the x axis. Increasing the x coordinate will move the object down and to the right on the screen.
	 */
	var isoX (default,default): Float;

	/**
	 * The axonometric position of the IsoSprite on the y axis. Increasing the y coordinate will move the object down and to the left on the screen.
	 */
	var isoY (default,default): Float;

	/**
	 * The axonometric position of the IsoSprite on the z axis. Increasing the z coordinate will move the object directly upwards on the screen.
	 */
	var isoZ (default,default): Float;

	/**
	 * A Point3 object representing the axonometric position of the IsoSprite.
	 */
	var isoPosition (default,null):Point3;

	/**
	 * A Cube object representing the derived boundsof the IsoSprite.
	 */
	var isoBounds (default,null):Point3;

	/**
	 * The non-unit distance of the IsoSprite from the 'front' of the scene. Used to correctly depth sort a group of IsoSprites.
	 */
	var depth (default,null):Float;
	
}
