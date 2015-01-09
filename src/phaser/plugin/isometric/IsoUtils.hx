package phaser.plugin.isometric;

import phaser.utils.Debug;
import phaser.gameobjects.GameObjectFactory;
import phaser.gameobjects.GameObjectCreator;
import phaser.core.Group;
import phaser.core.Game;
import phaser.physics.Physics;
import phaser.plugin.isometric.physics.Arcade;

class IsoUtils
{

	/**
	 * Visually renders an Octree to the display.
	 * In Octree.js file
	 *
	 * @param octree - The octree to render.
	 * @param color - The color of the lines in the quadtree.
	 */
	public static inline function octree (obj:Debug, octree:Octree, ?color:String='rgba(255,0,0,0.3)'):Void {
		return untyped obj.octree(octree,color);
	}

	public static inline function iso (obj:Game):Projector {
		return untyped obj.iso;
	}
	
	public static inline function isoArcade (obj:Physics):Arcade {
		return untyped obj.isoArcade;
	}
	
}

class IsoUtilsGameObjectCreator
{
	/**
	 * Create a new IsoSprite with specific position and sprite sheet key.
	 * In IsoSprite.js file
	 * @param x - X position of the new IsoSprite.
	 * @param y - Y position of the new IsoSprite.
	 * @param y - Z position of the new IsoSprite.
	 * @param key - This is the image or texture used by the Sprite during rendering. It can be a string which is a reference to the Cache entry, or an instance of a RenderTexture or PIXI.Texture.
	 * @param frame - If the sprite uses an image from a texture atlas or sprite sheet you can pass the frame here. Either a number for a frame ID or a string for a frame name.
	 * @param [group] - Optional Group to add the object to. If not specified it will be added to the World group.
	 * @returns the newly created IsoSprite object.
	 */
	public static inline function isoSprite  ( obj : GameObjectCreator , x:Float, y:Float, z:Float, key:Dynamic, ?frame:Dynamic):IsoSprite {
		return untyped obj.isoSprite(x,y,z,key,frame);
	}

}

class IsoUtilsGameObjectFactory
{
	/**
	 * Create a new IsoSprite with specific position and sprite sheet key.
	 * In IsoSprite.js file
	 * @param x - X position of the new IsoSprite.
	 * @param y - Y position of the new IsoSprite.
	 * @param y - Z position of the new IsoSprite.
	 * @param key - This is the image or texture used by the Sprite during rendering. It can be a string which is a reference to the Cache entry, or an instance of a RenderTexture or PIXI.Texture.
	 * @param frame - If the sprite uses an image from a texture atlas or sprite sheet you can pass the frame here. Either a number for a frame ID or a string for a frame name.
	 * @param group - Optional Group to add the object to. If not specified it will be added to the World group.
	 * @returns the newly created IsoSprite object.
	 */
	public static inline function isoSprite ( obj : GameObjectFactory , x:Float, y:Float, z:Float, key:Dynamic, ?frame:Dynamic, ?group:Group):IsoSprite {
		return untyped obj.isoSprite(x,y,z,key,frame, group);
	}

}

class IsoUtilsDebug
{
	/**
	 * In IsoSprite.js file
	 */
	public static inline function isoSprite (obj:Debug, sprite:Dynamic, ?color:String='rgba(0,255,0,0.4)', ?filled:Bool=true):Void {
		return untyped obj.isoSprite(sprite,color,filled);
	}

}
