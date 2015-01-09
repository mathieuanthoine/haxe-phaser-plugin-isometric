package phaser.plugin.isometric.physics;

import phaser.core.Game;
import phaser.geom.Point;

@:native("Phaser.Plugin.Isometric.Body")
extern class Body {
	/**
	 * The Physics Body is linked to a single IsoSprite. All physics operations should be performed against the body rather than
	 * the IsoSprite itself. For example you can set the velocity, acceleration, bounce values etc all on the Body.
	 * 
	 * @param sprite - The IsoSprite object this physics body belongs to.
	 */
	function new (sprite:IsoSprite)
    /**
     * Reference to the parent IsoSprite.
     */
    var sprite:IsoSprite;

    /**
     * Local reference to game.
     */
    var game:Game;

    /**
     * The type of physics system this body belongs to.
     */
    var type:String;
	
    /**
     * A disabled body won't be checked for any form of collision or overlap or have its pre/post updates run.
     */
    var enable:Bool;
	
    /**
     * The offset of the Physics Body from the IsoSprite x/y/z position.
     */
    var offset:Point;
	
    /**
     * The position of the physics body.
     */
    var position (default,null):Point3;
	
    /**
     * The previous position of the physics body.
     */
    var prev (default,null):Point;
	
    /**
     * Allow this Body to be rotated? (via angularVelocity, etc)
     */
    var allowRotation:Bool;
	
    /**
     * The amount the Body is rotated.
     */
    var rotation:Float;
	
    /**
     * The previous rotation of the physics body.
     */
    var preRotation (default,null) :Float;
	
    /**
     * The un-scaled original size.
     */
    var sourceWidthX (default,null):Float;
	
    /**
     * The un-scaled original size.
     */
    var sourceWidthY (default,null):Float;
	
    /**
     * The un-scaled original size.
     */
    var sourceHeight (default,null):Float;

    /**
     * The calculated X width (breadth) of the physics body.
     */
    var widthX:Float;
	
    /**
     * The calculated Y width (depth) of the physics body.
     */
    var widthY:Float;
	
    /**
     * The calculated height of the physics body.
     */
    var height:Float;
	
    /**
     * The calculated X width / 2 of the physics body.
     */
    var halfWidthX:Float;
	
    /**
     * The calculated X width / 2 of the physics body.
     */
    var halfWidthY:Float;
	
    /**
     * The calculated height / 2 of the physics body.
     */
    var halfHeight:Float;
	
    /**
     * The center coordinate of the physics body.
     */
    var center:Point3;
	
    /**
     * The velocity in pixels per second sq. of the Body.
     */
    var velocity:Point3;
	
    /**
     * New velocity.
     */
    var newVelocity:Point3;
	
    /**
     * The Sprite position is updated based on the delta x/y values. You can set a cap on those (both +-) using deltaMax.
     */
    var deltaMax:Point3;
	
    /**
     * The velocity in pixels per second sq. of the Body.
     */
    var acceleration:Point3;
	
    /**
     * The drag applied to the motion of the Body.
     */
    var drag:Point3;
	
    /**
     * Allow this Body to be influenced by gravity? Either world or local.
     */
    var allowGravity:Bool;
	
    /**
     * A local gravity applied to this Body. If non-zero this over rides any world gravity, unless Body.allowGravity is set to false.
     */
    var gravity:Point3;
	
    /**
     * The elasticitiy of the Body when colliding. bounce.x/y/z = 1 means full rebound, bounce.x/y/z = 0.5 means 50% rebound velocity.
     */
    var bounce:Point3;
	
    /**
     * The maximum velocity in pixels per second sq. that the Body can reach.
     */
    var maxVelocity:Point3;
	
    /**
     * The angular velocity in pixels per second sq. of the Body.
     */
    var angularVelocity:Float;
	
    /**
     * The angular acceleration in pixels per second sq. of the Body.
     */
    var angularAcceleration:Float;
	
    /**
     * The angular drag applied to the rotation of the Body.
     */
    var angularDrag:Float;
	
    /**
     * The maximum angular velocity in pixels per second sq. that the Body can reach.
     */
    var maxAngular:Float;
	
    /**
     * The mass of the Body.
     */
    var mass:Float;
	
    /**
     * The angle of the Body in radians as calculated by its velocity, rather than its visual angle.
     */
    var angle (default,null) :Float;
	
    /**
     * The speed of the Body as calculated by its velocity.
     */
    var speed (default,null):Float;
	
    /**
     * A const reference to the direction the Body is traveling or facing.
     */
    var facing:Float;
	
    /**
     * An immovable Body will not receive any impacts from other bodies.
     */
    var immovable:Bool;
	
    /**
     * If you have a Body that is being moved around the world via a tween or a Group motion, but its local x/y position never
     * actually changes, then you should set Body.moves = false. Otherwise it will most likely fly off the screen.
     * If you want the physics system to move the body around, then set moves to true.
     * Set to true to allow the Physics system to move this Body, other false to move it manually.
     */
    var moves:Bool;
	
    /**
     * This flag allows you to disable the custom x separation that takes place by Physics.IsoArcade.separate.
     * Used in combination with your own collision processHandler you can create whatever type of collision response you need.
     * Use a custom separation system or the built-in one?
     */
    var customSeparateX:Bool;
	
    /**
     * This flag allows you to disable the custom y separation that takes place by Physics.IsoArcade.separate.
     * Used in combination with your own collision processHandler you can create whatever type of collision response you need.
     * Use a custom separation system or the built-in one?
     */
    var customSeparateY:Bool;
	
    /**
     * This flag allows you to disable the custom z separation that takes place by Physics.IsoArcade.separate.
     * Used in combination with your own collision processHandler you can create whatever type of collision response you need.
     * Use a custom separation system or the built-in one?
     */
    var customSeparateZ:Bool;
	
    /**
     * When this body collides with another, the amount of overlap is stored here.
     * The amount of horizontal overlap during the collision.
     */
    var overlapX:Float;
	
    /**
     * When this body collides with another, the amount of overlap is stored here.
     * The amount of vertical overlap during the collision.
     */
    var overlapY:Float;
	
    /**
     * When this body collides with another, the amount of overlap is stored here.
     * The amount of vertical overlap during the collision.
     */
    var overlapZ:Float;
	
    /**
     * If a body is overlapping with another body, but neither of them are moving (maybe they spawned on-top of each other?) this is set to true.
     * Body embed value.
     */
    var embedded:Bool;
	
    /**
     * A Body can be set to collide against the World bounds automatically and rebound back into the World if this is set to true. Otherwise it will leave the World.
     * Should the Body collide with the World bounds?
     */
    var collideWorldBounds:Bool;
	
    /**
     * Set the checkCollision properties to control which directions collision is processed for this Body.
     * For example checkCollision.up = false means it won't collide when the collision happened while moving up.
     * An object containing allowed collision.
     */
    var checkCollision:Dynamic;

    /**
     * This object is populated with boolean values when the Body collides with another.
     * touching.up = true means the collision happened to the top of this Body for example.
     * An object containing touching results.
     */
    var touching:Dynamic;
	
    /**
     * This object is populated with previous touching values from the bodies previous collision.
     * An object containing previous touching results.
     */
    var wasTouching:Dynamic;

    /**
     * This object is populated with boolean values when the Body collides with the World bounds or a Tile.
     * For example if blocked.up is true then the Body cannot move up.
     * An object containing on which faces this Body is blocked from moving, if any.
     */
    var blocked:Dynamic;
	
    /**
     * Is this Body in a preUpdate (1) or postUpdate (2) state?
     */
    var phase:Int;
	
    /**
     * If true and you collide this IsoSprite against a Group, it will disable the collision check from using a QuadTree/Octree.
     */
    var skipTree:Bool;
	
    /**
     * Removes this body's reference to its parent sprite, freeing it up for gc.
     */
    function destroy ():Void;
	
    /**
     * You can modify the size of the physics Body to be any dimension you need.
     * So it could be smaller or larger than the parent Sprite. You can also control the x, y and z offset, which
     * is the position of the Body relative to the center of the Sprite.
     * @param widthX - The X width (breadth) of the Body.
     * @param widthY - The Y width (depth) of the Body.
     * @param height - The height of the Body.
     * @param offsetX - The X offset of the Body from the Sprite position.
     * @param offsetY - The Y offset of the Body from the Sprite position.
     * @param offsetZ - The Z offset of the Body from the Sprite position.
     */
    function setSize (widthX:Float, widthY:Float, height:Float, ?offsetX:Float, ?offsetY:Float, ?offsetZ:Float):Void;

    /**
     * Resets all Body values (velocity, acceleration, rotation, etc)
     * @param x - The new x position of the Body.
     * @param y - The new y position of the Body.
     * @param z - The new z position of the Body.
     */
    function reset (x:Float, y:Float, z:Float):Void;

    /**
     * Tests if a world point lies within this Body.
     * @param x - The world x coordinate to test.
     * @param y - The world y coordinate to test.
     * @param z - The world z coordinate to test.
     * @return True if the given coordinates are inside this Body, otherwise false.
     */
    function hitTest (x:Float, y:Float, z:Float):Bool;

    /**
     * Returns true if the bottom of this Body is in contact with either the world bounds.
     * @return True if in contact with either the world bounds.
     */
    function onFloor ():Bool;

    /**
     * Returns true if either side of this Body is in contact with either the world bounds.
     * @return True if in contact with world bounds.
     */
    function onWall ():Bool;

    /**
     * Returns the absolute delta x value.
     * @return The absolute delta value.
     */
    function deltaAbsX ():Float;

    /**
     * Returns the absolute delta y value.
     * @return The absolute delta value.
     */
    function deltaAbsY ():Float;

    /**
     * Returns the absolute delta z value.
     * @return The absolute delta value.
     */
    function deltaAbsZ ():Float;

    /**
     * Returns the delta x value. The difference between Body.x now and in the previous step.
     * @return The delta value. Positive if the motion was to the right, negative if to the left.
     */
    function deltaX ():Float;

    /**
     * Returns the delta y value. The difference between Body.y now and in the previous step.
     * @return The delta value. Positive if the motion was downwards, negative if upwards.
     */
    function deltaY ():Float;

    /**
     * Returns the delta z value. The difference between Body.z now and in the previous step.
     * @return The delta value. Positive if the motion was downwards, negative if upwards.
     */
    function deltaZ ():Float;

    /**
     * Returns the delta r value. The difference between Body.rotation now and in the previous step.
     * @return The delta value. Positive if the motion was clockwise, negative if anti-clockwise.
     */
    function deltaR ():Float;

    /**
     * Returns the 8 corners that make up the body's bounding cube.
     * @return An array of Phaser.Plugin.Isometric.Point3 values specifying each corner co-ordinate.
     */
    function getCorners ():Array<Point3>;

	/**
	 * The top value of this Body (same as Body.z + Body.height)
	 */
	var top (default,null):Float;
	
	/**
	 * The front X value of this Body (same as Body.x + Body.widthX)
	 */
	var frontX (default,null):Float;

	/**
	 * The right value of this Body (same as Body.x + Body.widthX) - alias used for QuadTree
	 */
	var right (default,null):Float;

	/**
	 * The front Y value of this Body (same as Body.y + Body.widthY)
	 */
	var frontY (default,null):Float;

	/**
	 * The bottom value of this Body (same as Body.y + Body.widthY) - alias used for QuadTree
	 */
	var bottom (default,null):Float;

	/**
	 * The x position.
	 */
	var x (default,null):Float;

	/**
	 * The y position.
	 */
	var y (default,null):Float;

	/**
	 * The z position.
	 */
	var z (default,null):Float;

	/**
	 * Render IsoSprite Body.
	 * @param context - The context to render to.
	 * @param body - The Body to render the info of.
	 * @param color - color of the debug info to be rendered. (format is css color string).
	 * @param filled - Render the objected as a filled (default, true) or a stroked (false)
	 */
	static function render (context:Dynamic, body:Body, ?color:String='rgba(0,255,0,0.4)', ?filled:Bool=true):Void;

	/**
	 * Render IsoSprite Body Physics Data as text.
	 * @param body - The Body to render the info of.
	 * @param x - X position of the debug info to be rendered.
	 * @param y - Y position of the debug info to be rendered.
	 * @param [color='rgb(255,255,255)'] - color of the debug info to be rendered. (format is css color string).
	 */
	static function renderBodyInfo (debug:Dynamic, body:Body):Void;
	
}
