package phaser.plugin.isometric;

import phaser.core.Group;

@:native("Phaser.Plugin.Isometric.Octree")
extern class Octree {

	/**
	 * A Octree implementation based on Phaser.QuadTree.
	 * Original version at https://github.com/timohausmann/quadtree-js/
	 * 
	 * @param x - The bottom-back coordinate of the octree.
	 * @param y - The bottom-back coordinate of the octree.
	 * @param z - The bottom-back coordinate of the octree.
	 * @param widthX - The width X (breadth) of the octree.
	 * @param widthY - The width Y (depth) of the octree.
	 * @param height - The height (Z) of the octree.
	 * @param maxObjects - The maximum number of objects per node.
	 * @param maxLevels - The maximum number of levels to iterate to.
	 * @param level - Which level is this?
	 */
	function new (x:Float, y:Float, z:Float, widthX:Float, widthY:Float, height:Float, ?maxObjects:UInt = 10, ?maxLevels:UInt = 4, ?level:UInt = 0);

    /**
     * The maximum number of objects per node.
     */
    var maxObjects:UInt;

    /**
     * The maximum number of levels to break down to.
     */
    var maxLevels:UInt;

    /**
     * The current level.
     */
    var level:UInt;

    /**
     * Object that contains the octree bounds.
     */
    var bounds:Dynamic;

    /**
     * Array of octree children.
     */
    var objects:Array<Octree>;

    /**
     * @property Array of associated child nodes.
     */
    var nodes:Array<Dynamic>;

    /**
     * Resets the QuadTree.
     * @param x - The bottom-back coordinate of the octree.
     * @param y - The bottom-back coordinate of the octree.
     * @param z - The bottom-back coordinate of the octree.
     * @param widthX - The width X (breadth) of the octree.
     * @param widthY - The width Y (depth) of the octree.
     * @param height - The height (Z) of the octree.
     * @param maxObjects - The maximum number of objects per node.
     * @param maxLevels - The maximum number of levels to iterate to.
     * @param level - Which level is this?
     */
	function reset (x:Float, y:Float, z:Float, widthX:Float, widthY:Float, height:Float, ?maxObjects:UInt=10, ?maxLevels:UInt=4, ?level:UInt=0): Void;

    /**
     * Populates this octree with the children of the given Group. In order to be added the child must exist and have a body property.
     * @param group - The Group to add to the octree.
     */
    function populate (group:Group):Void;

    /**
     * Handler for the populate method.
     * @param sprite - The Sprite to check.
     */
    function populateHandler (sprite:Dynamic):Void;

    /**
     * Split the node into 8 subnodes
     */
    function split ():Void;

    /**
     * Insert the object into the node. If the node exceeds the capacity, it will split and add all objects to their corresponding subnodes.
     * @param body - The Body object to insert into the octree. Can be any object so long as it exposes x, y, z, frontX, frontY and top properties.
     */
    function insert (body:Dynamic):Void;

    /**
     * Determine which node the object belongs to.
     * @param cube - The bounds in which to check.
     * @return index - Index of the subnode (0-7), or -1 if cube cannot completely fit within a subnode and is part of the parent node.
     */
    function getIndex (cube:Cube):Int;
	
    /**
     * Return all objects that could collide with the given IsoSprite or Cube.
     * @param source - The source object to check the Octree against. Either a IsoSprite or Cube.
     * @return Array with all detected objects.
     */
    function retrieve (source:Dynamic):Array<Dynamic>;

    /**
     * Clear the octree.
     */
    function clear ():Void;
	
}