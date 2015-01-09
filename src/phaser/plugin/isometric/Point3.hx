package phaser.plugin.isometric;

@:native("Phaser.Plugin.Isometric.Point3")
extern class Point3 {
	/**
	 * The Point3 object represents a location in a three-dimensional coordinate system,
	 * where x and y represent the horizontal axes and z represents the vertical axis.
	 * The following code creates a point at (0,0,0):
	 * `var myPoint = new phaser.plugin.isometric.Point3();`
	 * 
	 * Creates a new Point3 object. If you pass no parameters a Point3 is created set to (0, 0, 0).
	 */
	function new (?x:Float=0, ?y:Float=0, ?z:Float=0);

    /**
     * The x value of the point.
     */
    var x:Float;

    /**
     * The y value of the point.
     */
    var y:Float;

    /**
     * The z value of the point.
     */
    var z:Float;

    /**
     * Copies the x, y and z properties from any given object to this Point3.
     */
    function copyFrom (source:Dynamic/*any*/):Point3;

    /**
     * Copies the x, y and z properties from this Point3 to any given object.
     */
    function copyTo (dest:Dynamic/*any*/):Dynamic;

    /**
     * Determines whether the given object's x/y/z values are equal to this Point3 object.
     */
    function equals (a:Dynamic/*any*/):Bool;

    /**
     * Sets the x, y and z values of this Point3 object to the given values.
     * If you omit the y and z value then the x value will be applied to all three, for example:
     * `Point3.set(2)` is the same as `Point3.set(2, 2, 2)`
     * If however you set both x and y, but no z, the z value will be set to 0.
     */
    function set (?x:Float=0, ?y:Float, ?z:Float):Point3;

    /**
     * Sets the x, y and z values of this Point3 object to the given values.
     * If you omit the y and z value then the x value will be applied to all three, for example:
     * `Point3.setTo(2)` is the same as `Point3.setTo(2, 2, 2)`
     * If however you set both x and y, but no z, the z value will be set to 0.
     */
    function setTo (?x:Float, ?y:Float, ?z:Float):Point3;

    /**
     * Adds the given x, y and z values to this Point3.
     */
    public function add (?x:Float=0, ?y:Float=0):Void;
	
    /**
     * Subtracts the given x, y and z values from this Point3.
     */
    function subtract (?x:Float=0, ?y:Float=0, ?z:Float=0):Point3;

    /**
     * Multiplies Point3.x, Point3.y and Point3.z by the given x and y values. Sometimes known as `Scale`.
     */
    function multiply (?x:Float=1, ?y:Float=1, ?z:Float=1):Point3;

    /**
     * Divides Point3.x, Point3.y and Point3.z by the given x, y and z values.
     */
    function divide (?x:Float=1, ?y:Float=1, ?z:Float=1):Point3;

	/**
	 * Adds the coordinates of two points together to create a new point.
	 */
	//static function add (a:Point3, b:Point3, ?out:Point3):Point3;

	/**
	 * Subtracts the coordinates of two points to create a new point.
	 */
	//static function subtract (a:Point3, b:Point3, ?out:Point3):Point3;
	
	/**
	 * Multiplies the coordinates of two points to create a new point.
	 */
	//static function multiply (a:Point3, b:Point3, ?out:Point3):Point3;

	/**
	 * Divides the coordinates of two points to create a new point.
	 */
	//static function divide (a:Point3, b:Point3, ?out:Point3):Point3;

	/**
	 * Determines whether the two given Point3 objects are equal. They are considered equal if they have the same x, y and z values.
	 */
	//static function equal (a:Point3, b:Point3):Bool;
	
}