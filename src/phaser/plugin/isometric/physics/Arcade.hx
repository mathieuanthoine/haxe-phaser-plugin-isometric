// World.js file
package phaser.plugin.isometric.physics;

import phaser.core.Game;
import phaser.math.QuadTree;
import phaser.plugin.isometric.Octree;

@:native("Phaser.Plugin.Isometric.Arcade")
extern class Arcade {
	/**
	 * IsoArcade Physics constructor.
	 * @param game reference to the current game instance.
	 */
	function new (game:Game);
	
	/**
	 * Local reference to game.
	 */
	var game:Game;

	/**
	 * The World gravity setting. Defaults to x: 0, y: 0, z: 0 or no gravity.
	 */
	var gravity:Point3;
	
	/**
	 * The bounds inside of which the physics world exists. Defaults to match the world bounds relatively closely given the isometric projection.
	 */
	var bounds:Cube;
	
	/**
	 * Set the checkCollision properties to control for which bounds collision is processed.
	 * For example checkCollision.down = false means Bodies cannot collide with the World.bounds.bottom.
	 * An object containing allowed collision flags.
	 */
	var checkCollision:Dynamic;

	/**
	 * Used by the QuadTree/Octree to set the maximum number of objects per quad.
	 */
	var maxObjects:UInt;

	/**
	 * Used by the QuadTree/Octree to set the maximum number of iteration levels.
	 */
	var maxLevels:UInt;

	/**
	 * A value added to the delta values during collision checks.
	 */
	var OVERLAP_BIAS:Int;

	/**
	 * If true World.separate will always separate on the X and Y axes before Z. Otherwise it will check gravity totals first.
	 */
	var forceXY:Bool;

	/**
	 * If true an Octree/QuadTree will never be used for any collision. Handy for tightly packed games. See also Body.skipTree.
	 */
	var skipTree:Bool;

	/**
	 * If true, the collision/overlap routines will use a QuadTree, which will ignore the z position of objects when determining potential collisions. This will be faster if you don't do a lot of stuff on the z-axis.
	 */
	var useQuadTree:Bool;

	/**
	 * The world QuadTree.
	 */
	var quadTree:QuadTree;
	
	/**
	 * The world Octree.
	 */
	var octree:Octree;
	
	/**
	 * Updates the size of this physics world.
	 * @param x - Bottom rear most corner of the world.
	 * @param y - Bottom rear most corner of the world.
	 * @param z - Bottom rear most corner of the world.
	 * @param widthX - New X width (breadth) of the world. Can never be smaller than the Game.width.
	 * @param widthY - New Y width (depth) of the world. Can never be smaller than the Game.width.
	 * @param height - New height of the world. Can never be smaller than the Game.height.
	 */
	function setBounds (x:Float, y:Float, z:Float, widthX:Float, widthY:Float, height:Float):Void;

	/**
	 * Updates the size of this physics world to match the size of the game world.
	 */
	function setBoundsToWorld ():Void;

	/**
	 * This will create an IsoArcade Physics body on the given game object or array of game objects.
	 * A game object can only have 1 physics body active at any one time, and it can't be changed until the object is destroyed.
	 * @param object - The game object to create the physics body on. Can also be an array or Group of objects, a body will be created on every child that has a `body` property.
	 * @param children - Should a body be created on all children of this object? If true it will recurse down the display list as far as it can go.
	 */
	function enable (object:Dynamic, ?children:Bool=true):Void;
	
	/**
	 * Creates an IsoArcade Physics body on the given game object.
	 * A game object can only have 1 physics body active at any one time, and it can't be changed until the body is nulled.
	 * @param object - The game object to create the physics body on. A body will only be created if this object has a null `body` property.
	 */
	function enableBody (object:Dynamic):Void;

	/**
	 * Called automatically by a Physics body, it updates all motion related values on the Body.
	 * @param body - The Body object to be updated.
	 */
	function updateMotion (body:Body):Void;

	/**
	 * A tween-like function that takes a starting velocity and some other factors and returns an altered velocity.
	 * Based on a function in Flixel by @ADAMATOMIC
	 * @param axis - 0 for nothing, 1 for X-axis, 2 for Y-axis, 3 for vertical (Z-axis).
	 * @param body - The Body object to be updated.
	 * @param velocity - Any component of velocity (e.g. 20).
	 * @param acceleration - Rate at which the velocity is changing.
	 * @param drag - Really kind of a deceleration, this is how much the velocity changes if Acceleration is not set.
	 * @param max - An absolute value cap for the velocity.
	 * @return The altered Velocity value.
	 */
	function computeVelocity (axis:Float, body:Body, velocity:Float, acceleration:Float, drag:Float, ?max:Float=10000):Float;

	/**
	 * Checks for overlaps between two game objects. The objects can be IsoSprites or Groups.
	 * You can perform IsoSprite vs. IsoSprite, IsoSprite vs. Group and Group vs. Group overlap checks.
	 * Unlike collide the objects are NOT automatically separated or have any physics applied, they merely test for overlap results.
	 * The second parameter can be an array of objects, of differing types.
	 * NOTE: This function is not recursive, and will not test against children of objects passed (i.e. Groups within Groups).
	 * @param object1 - The first object to check. Can be an instance of Phaser.Plugin.Isometric.IsoSprite or Phaser.Group.
	 * @param object2 - The second object or array of objects to check. Can be Phaser.Plugin.Isometric.IsoSprite or Phaser.Group.
	 * @param [overlapCallback=null] - An optional callback function that is called if the objects overlap. The two objects will be passed to this function in the same order in which you specified them.
	 * @param [processCallback=null] - A callback function that lets you perform additional checks against the two objects if they overlap. If this is set then overlapCallback will only be called if processCallback returns true.
	 * @param [callbackContext] - The context in which to run the callbacks.
	 * @return True if an overlap occured otherwise false.
	 */
	function overlap (object1:Dynamic, object2:Dynamic, ?overlapCallback:Dynamic=null, ?processCallback:Dynamic=null, ?callbackContext:Dynamic=null):Bool;

	/**
	 * Checks for collision between two game objects. You can perform IsoSprite vs. IsoSprite, IsoSprite vs. Group or Group vs. Group collisions.
	 * The second parameter can be an array of objects, of differing types.
	 * The objects are also automatically separated. If you don't require separation then use IsoArcade.overlap instead.
	 * An optional processCallback can be provided. If given this function will be called when two sprites are found to be colliding. It is called before any separation takes place,
	 * giving you the chance to perform additional checks. If the function returns true then the collision and separation is carried out. If it returns false it is skipped.
	 * The collideCallback is an optional function that is only called if two sprites collide. If a processCallback has been set then it needs to return true for collideCallback to be called.
	 * NOTE: This function is not recursive, and will not test against children of objects passed (i.e. Groups within Groups).
	 * @param object1 - The first object to check. Can be an instance of Phaser.Plugin.Isometric.IsoSprite or Phaser.Group.
	 * @param object2 - The second object or array of objects to check. Can be Phaser.Plugin.Isometric.IsoSprite or Phaser.Group.
	 * @param collideCallback - An optional callback function that is called if the objects collide. The two objects will be passed to this function in the same order in which you specified them, unless you are colliding Group vs. Sprite, in which case Sprite will always be the first parameter.
	 * @param processCallback - A callback function that lets you perform additional checks against the two objects if they overlap. If this is set then collision will only happen if processCallback returns true. The two objects will be passed to this function in the same order in which you specified them.
	 * @param callbackContext - The context in which to run the callbacks.
	 * @return True if a collision occured otherwise false.
	 */
	function collide (object1:Dynamic, ?object2:Dynamic, ?overlapCallback:Dynamic=null, ?processCallback:Dynamic=null, ?callbackContext:Dynamic=null):Bool;

	/**
	 * Check for intersection against two bodies.
	 * @param body1 - The Body object to check.
	 * @param body2 - The Body object to check.
	 * @return True if they intersect, otherwise false.
	 */
	function intersects (body1:Body, body2:Body):Bool;

	/**
	 * Find the distance between two display objects (like Sprites).
	 * @param source - The Display Object to test from.
	 * @param target - The Display Object to test to.
	 * @return The distance between the source and target objects.
	 */
	function distanceBetween (source:Dynamic, target:Dynamic):Float;

	/**
	 * Find the distance between a display object (like a Sprite) and the given x/y coordinates only (ignore z).
	 * The calculation is made from the display objects x/y coordinate. This may be the top-left if its anchor hasn't been changed.
	 * If you need to calculate from the center of a display object instead use the method distanceBetweenCenters()
	 * @param displayObject - The Display Object to test from.
	 * @param x - The x coordinate to test to.
	 * @param y - The y coordinate to test to.
	 * @return The distance between the object and the x/y coordinates.
	 */
	function distanceToXY (displayObject:Dynamic, x:Float, y:Float):Float;
	
	/**
	 * Find the distance between a display object (like a Sprite) and the given x/y/z coordinates.
	 * The calculation is made from the display objects x/y/z coordinate. This may be the top-left if its anchor hasn't been changed.
	 * If you need to calculate from the center of a display object instead use the method distanceBetweenCenters()
	 * @param displayObject - The Display Object to test from.
	 * @param x - The x coordinate to test to.
	 * @param y - The y coordinate to test to.
	 * @param z - The y coordinate to test to
	 * @return The distance between the object and the x/y coordinates.
	 */
	function distanceToXYZ (displayObject:Dynamic, x:Float, y:Float, z:Float):Float;
}