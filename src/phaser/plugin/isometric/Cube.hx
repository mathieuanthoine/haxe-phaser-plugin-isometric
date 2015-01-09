package phaser.plugin.isometric;

@:native("Phaser.Plugin.Isometric.Cube")
extern class Cube {

	/**
	 * Creates a new Cube object with the bottom-back corner specified by the x, y and z parameters, with the specified breadth (widthX), depth (widthY) and height parameters. If you call this function without parameters, a Cube with x, y, z, breadth, depth and height properties set to 0 is created.
	 * @param x - The x coordinate of the bottom-back corner of the Cube.
	 * @param y - The y coordinate of the bottom-back corner of the Cube.
	 * @param z - The z coordinate of the bottom-back corner of the Cube.
	 * @param widthX - The X axis width (breadth) of the Cube. Should always be either zero or a positive value.
	 * @param widthY - The Y axis width (depth) of the Cube. Should always be either zero or a positive value.
	 * @param height - The Z axis height of the Cube. Should always be either zero or a positive value.
	 */
	function new (?x:Float=0, ?y:Float=0, ?z:Float=0, ?widthX:Float=0, ?widthY:Float=0, ?height:Float=0);

	/**
	 * The x coordinate of the bottom-back corner of the Cube.
	 */
	var x:Float;

	/**
	 * The y coordinate of the bottom-back corner of the Cube.
	 */
	var y:Float;

	/**
	 * The z coordinate of the bottom-back corner of the Cube.
	 */
	var z:Float;

	/**
	 * The X axis width (breadth) of the Cube. This value should never be set to a negative.
	 */
	var widthX:Float;

	/**
	 * The Y axis width (depth) of the Cube. This value should never be set to a negative.
	 */
	var widthY:Float;

	/**
	 * The Z axis height of the Cube. This value should never be set to a negative.
	 */
	var height:Float;

	/**
	 * Sets the members of Cube to the specified values.
	 * @param x - The x coordinate of the bottom-back corner of the Cube.
	 * @param y - The y coordinate of the bottom-back corner of the Cube.
	 * @param z - The z coordinate of the bottom-back corner of the Cube.
	 * @param widthX - The X axis width (breadth) of the Cube. This value should never be set to a negative.
	 * @param widthY - The Y axis width (depth) of the Cube. This value should never be set to a negative.
	 * @param height - The Z axis height of the Cube. This value should never be set to a negative.
	 * @return This Cube object
	 */
	function setTo (x:Float, y:Float, z:Float, widthX:Float, widthY:Float, height:Float):Cube;

	/**
	 * Copies the x, y, z, widthX, widthY and height properties from any given object to this Cube.
	 * @param source - The object to copy from.
	 * @return This Cube object.
	 */
	function copyFrom (source:Dynamic):Cube;

	/**
	 * Copies the x, y, z, widthX, widthY and height properties from this Cube to any given object.
	 * @param dest - The object to copy to.
	 * @return This Cube object.
	 */
	function copyTo (dest:Dynamic):Cube;

	/**
	 * The size of the Cube object, expressed as a Point3 object with the values of the widthX, widthY and height properties.
	 * @param output - Optional Point3 object. If given the values will be set into the object, otherwise a brand new Point3 object will be created and returned.
	 * @return The size of the Cube object.
	 */
	function size (?output:Point3):Point3;

	/**
	* Determines whether the specified coordinates are contained within the region defined by this Cube object.
	* @param x - The x coordinate of the point to test.
	* @param y - The y coordinate of the point to test.
	* @param y - The z coordinate of the point to test.
	* @return A value of true if the Cube object contains the specified point; otherwise false.
	*/
	function contains (x:Float, y:Float, z:Float):Bool;

	/**
	* Determines whether the specified X and Y coordinates are contained within the region defined by this Cube object.
	* @param x - The x coordinate of the point to test.
	* @param y - The y coordinate of the point to test.
	* @return A value of true if this Cube object contains the specified point; otherwise false.
	*/
	function containsXY (x:Float, y:Float):Bool;

	/**
	 * Returns a new Cube object with the same values for the x, y, z, widthX, widthY and height properties as the original Cube object.
	 * @param output - Optional Cube object. If given the values will be set into the object, otherwise a brand new Cube object will be created and returned.
	 * @return A Cube
	 */
	function clone (?output:Cube):Cube;

	/**
	 * Determines whether the two Cubes intersect with each other.
	 * This method checks the x, y, z, widthX, widthY, and height properties of the Cubes.
	 * @param b - The second Cube object.
	 * @return A value of true if the specified object intersects with this Cube object; otherwise false.
	 */
	function intersects (b:Cube):Bool;

	/**
	 * Updates and returns an Array of eight Point3 objects containing the corners of this Cube.
	 * @return The corners of this Cube expressed as an Array of eight Point3 objects.
	 */
	function getCorners ():Array<Point3>;

	/**
	 * Returns a string representation of this object.
	 * @return A string representation of the instance.
	 */
	function toString ():String;
	
	/**
	 * Half of the widthX of the Cube.
	 */
	var halfWidthX (default, null):Float;

	/**
	 * Half of the widthY of the Cube.
	 */
	var halfWidthY (default, null):Float;

	/**
	 * Half of the height of the Cube.
	 */
	var halfHeight (default, null):Float;

	/**
	 * The z coordinate of the bottom of the Cube. Changing the bottom property of a Cube object has no effect on the x, y, widthX and widthY properties.
	 * However it does affect the height property, whereas changing the z value does not affect the height property.
	 */
	var bottom (default, default):Float;

	/**
	 * The sum of the z and height properties. Changing the top property of a Cube object has no effect on the x, y, z, widthX and widthY properties, but does change the height property.
	 */
	var top (default, default):Float;

	/**
	 * The x coordinate of the back of the Cube. Changing the backX property of a Cube object has no effect on the y, z, widthY and height properties. However it does affect the widthX property, whereas changing the x value does not affect the width property.
	 */
	var backX (default, default):Float;

	/**
	 * The y coordinate of the back of the Cube. Changing the backY property of a Cube object has no effect on the x, z, widthX and height properties. However it does affect the widthY property, whereas changing the y value does not affect the width property.
	 */
	var backY (default, default):Float;
	
	/**
	 * The sum of the x and widthX properties. Changing the frontX property of a Cube object has no effect on the x, y, z, widthY and height properties, however it does affect the widthX property.
	 */
	var frontX (default, default):Float;

	/**
	 * The sum of the y and widthY properties. Changing the frontY property of a Cube object has no effect on the x, y, z, widthX and height properties, however it does affect the widthY property.
	 */
	var frontY (default, default):Float;

	/**
	 * The volume of the Cube derived from widthX * widthY * height.
	 */
	var volume (default, null):Float;

	/**
	 * The x coordinate of the center of the Cube.
	 */
	var centerX (default, default):Float;

	/**
	 * The y coordinate of the center of the Cube.
	 */
	var centerY (default, default):Float;

	/**
	 * The z coordinate of the center of the Cube.
	 */
	var centerZ (default, default):Float;

	/**
	 * A random value between the frontX and backX values (inclusive) of the Cube.
	 */
	var randomX (default, null):Float;

	/**
	 * A random value between the frontY and backY values (inclusive) of the Cube.
	 */
	var randomY (default, null):Float;

	/**
	 * A random value between the bottom and top values (inclusive) of the Cube.
	 */
	var randomZ (default, null):Float;

	/**
	 * Determines whether or not this Cube object is empty. A Cube object is empty if its widthX, widthY or height is less than or equal to 0.
	 * If set to true then all of the Cube properties are set to 0.
	 */
	var empty (default, default):Bool;
	
	/**
	 * The size of the Cube object, expressed as a Point3 object with the values of the widthX, widthY and height properties.
	 * @param a - The Cube object.
	 * @param output - Optional Point3 object. If given the values will be set into the object, otherwise a brand new Point3 object will be created and returned.
	 * @return The size of the Cube object
	 */
	//static function size (a:Cube, ?output:Point3):Point3;

	/**
	 * Returns a new Cube object with the same values for the x, y, z, widthX, widthY, and height properties as the original Cube object.
	 * @param a - The Cube object.
	 * @param output - Optional Cube object. If given the values will be set into the object, otherwise a brand new Cube object will be created and returned.
	 * @return
	 */
	//static function clone (a:Cube, ?output:Cube):Cube;

	/**
	 * Determines whether the specified coordinates are contained within the region defined by this Cube object.
	 * @param a - The Cube object.
	 * @param x - The x coordinate of the point to test.
	 * @param y - The y coordinate of the point to test.
	 * @param z - The z coordinate of the point to test.
	 * @return A value of true if the Cube object contains the specified point; otherwise false.
	 */
	//static function contains (a:Cube, x:Float, y:Float, z:Float):Bool;

	/**
	 * Determines whether the specified X and Y coordinates are contained within the region defined by this Cube object.
	 * @param a - The Cube object.
	 * @param x - The x coordinate of the point to test.
	 * @param y - The y coordinate of the point to test.
	 * @return A value of true if the Cube object contains the specified point; otherwise false.
	 */
	//static function containsXY (a:Cube, x:Float, y:Float):Bool;

	/**
	 * Determines whether the specified point is contained within the cubic region defined by this Cube object. This method is similar to the Cube.contains() method, except that it takes a Point3 object as a parameter.
	 * @param a - The Cube object.
	 * @param point3 - The Point3 object being checked. Can be Point3 or any object with .x, .y and .z values.
	 * @return A value of true if the Cube object contains the specified point; otherwise false.
	 */
	static function containsPoint3 (a:Cube, point3:Point3):Bool;

	/**
	 * Determines whether the first Cube object is fully contained within the second Cube object.
	 * A Cube object is said to contain another if the second Cube object falls entirely within the boundaries of the first.
	 * @param a - The first Cube object.
	 * @param b - The second Cube object.
	 * @return A value of true if the Cube object contains the specified point; otherwise false.
	 */
	static function containsCube (a:Cube, b:Cube):Bool;

	/**
	 * Determines whether the two Cubes intersect with each other.
	 * This method checks the x, y, z, widthX, widthY, and height properties of the Cubes.
	 * @param a - The first Cube object.
	 * @param b - The second Cube object.
	 * @return A value of true if the specified object intersects with this Cube object; otherwise false.
	 */
	//static function intersects (a:Cube, b:Cube):Bool;

}