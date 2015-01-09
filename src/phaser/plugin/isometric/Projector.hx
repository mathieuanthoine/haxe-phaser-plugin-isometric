package phaser.plugin.isometric;

import phaser.core.Game;
import phaser.core.Group;
import phaser.geom.Point;

@:native("Phaser.Plugin.Isometric.Projector")
extern class Projector {

	/**
	 * Creates a new Isometric Projector object, which has helpers for projecting x, y and z coordinates into axonometric x and y equivalents.
	 * @param game - The current game object.
	 * @param projectionAngle - The angle of the axonometric projection in radians. Defaults to approx. 0.4636476 (Math.atan(0.5) which is suitable for 2:1 pixel art dimetric)
	 */
	function new  (game:Game, projectionAngle:Float);

	/**
	 * game - The current game object.
	 */
	var game:Game;

	/**
	 * The angle of projection in radians.
	 */
	var projectionAngle:Float;
	
	/**
	 * The x and y offset multipliers as a ratio of the game world size.
	 */
	var anchor:Point;

	/**
	 * Use axonometric projection to transform a 3D Point3 coordinate to a 2D Point coordinate. If given the coordinates will be set into the object, otherwise a brand new Point object will be created and returned.
	 * @param point3 - The Point3 to project from.
	 * @param out - The Point to project to.
	 * @return The transformed Point.
	 */
	function project (point3:Point3, out:Point):Point;

	/**
	 * Use axonometric projection to transform a 3D Point3 coordinate to a 2D Point coordinate, ignoring the z-axis. If given the coordinates will be set into the object, otherwise a brand new Point object will be created and returned.
	 * @param point3 - The Point3 to project from.
	 * @param out - The Point to project to.
	 * @return The transformed Point.
	 */
	function projectXY (point3:Point3, out:Point):Point;

	/**
	 * Use reverse axonometric projection to transform a 2D Point coordinate to a 3D Point3 coordinate. If given the coordinates will be set into the object, otherwise a brand new Point3 object will be created and returned.
	 * @param point - The Point to project from.
	 * @param out - The Point3 to project to.
	 * @param z - Specified z-plane to project to.
	 * @return The transformed Point3.
	 */
	function unproject (point:Point, out:Point3, ?z:Float=0):Point3;

	/**
	 * Perform a simple depth sort on all IsoSprites in the passed group. This function is fast and will accurately sort items on a single z-plane, but breaks down when items are above/below one another in certain configurations.
	 * @param group - A group of IsoSprites to sort.
	 */
	function simpleSort(group:Group):Void;

	/**
	 * Perform a volume-based topological sort on all IsoSprites in the passed group or array. Will use the body if available, otherwise it will use an automatically generated bounding cube. If a group is passed, <code>Phaser.Group#sort</code> is automatically called on the specified property.
	 * Routine adapted from this tutorial: http://mazebert.com/2013/04/18/isometric-depth-sorting/
	 * @param group - A group or array of IsoSprites to sort.
	 * @param padding - The amount of extra tolerance in the depth sorting; larger values reduce flickering when objects collide, but also introduce inaccuracy when objects are close. Defaults to 1.5.
	 * @param prop - The property to store the depth information on. If not specified, it will default to 'isoDepth'.
	 */
	function topologicalSort (group:Dynamic, ?padding:Float=1.5, ?prop:String="isoDepth"):Void;
		
}