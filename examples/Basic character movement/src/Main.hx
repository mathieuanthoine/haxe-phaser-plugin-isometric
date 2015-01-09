package;

import phaser.core.Game;
import phaser.core.Group;
import phaser.input.Key;
import phaser.input.Keyboard;
import phaser.Phaser;
import phaser.plugin.isometric.Isometric;
import phaser.plugin.isometric.IsoSprite;

using phaser.plugin.isometric.IsoUtils;

class Main 
{
	
	private var isoGroup:Group;
	
	private var player:IsoSprite;
	
	private var cursors:Dynamic;
		
	static function main ():Void {
		new Main();
	}
	
	public var game:Game;
	
	private function new () {
		game = new Game(800, 400, Phaser.AUTO, 'test', { preload: preload, create: create, update:update, render:render });
	}
	
	private function preload(): Void {
		game.load.image("cube", "assets/cube.png");
		
		game.time.advancedTiming = true;
		
		// Add and enable the plug-in.
		game.plugins.add(new Isometric(game));
		
		// Start the IsoArcade physics system.
		game.physics.startSystem(Isometric.ISOARCADE);
		
		// This is used to set a game canvas-based offset for the 0, 0, 0 isometric coordinate - by default
        // this point would be at screen coordinates 0, 0 (top left) which is usually undesirable.
		game.iso().anchor.setTo (0.5, 0.2);
	}
	
	private function create (): Void {
		
		// Create a group for our tiles, so we can use Group.sort
		isoGroup = game.add.group();
		
		// Set the global gravity for IsoArcade.
       game.physics.isoArcade().gravity.setTo(0, 0, -500);
		
		// Let's make a load of cubes on a grid, but do it back-to-front so they get added out of order.
        var cube:IsoSprite;		
		
		var xx:Int = 256;
		var yy:Int;
		
		while (xx > 0) {
			yy = 256;
            while (yy>0) {
                // Create a cube using the new game.add.isoSprite factory method at the specified position.
                // The last parameter is the group you want to add it to (just like game.add.sprite)                
				cube = game.add.isoSprite(xx, yy, 0, 'cube', 0, isoGroup);
                cube.anchor.set(0.5);

				// Enable the physics body on this cube.
                game.physics.isoArcade().enable(cube);

                // Collide with the world bounds so it doesn't go falling forever or fly off the screen!
                cube.body.collideWorldBounds = true;

                // Add a full bounce on the x and y axes, and a bit on the z axis. 
                cube.body.bounce.set(1, 1, 0.2);

                // Send the cubes off in random x and y directions! Wheee!
                cube.body.drag.set(100, 100, 0);
				
				yy -= 80;
			}
			xx -= 80;	
        }	
		
		 // Create another cube as our 'player', and set it up just like the cubes above.
        player = game.add.isoSprite(128, 128, 0, 'cube', 0, isoGroup);
        player.tint = 0x86bfda;
        player.anchor.set(0.5);
        game.physics.isoArcade().enable(player);
        player.body.collideWorldBounds = true;

        // Set up our controls.
        cursors = game.input.keyboard.createCursorKeys();
		
		game.input.keyboard.addKeyCapture([
            Keyboard.LEFT,
            Keyboard.RIGHT,
            Keyboard.UP,
            Keyboard.DOWN,
            Keyboard.SPACEBAR
        ]);

        var space:Key = game.input.keyboard.addKey(Keyboard.SPACEBAR);

        space.onDown.add(function () { player.body.velocity.z = 300;});
	}
	
	private function update (): Void {
		 // Move the player at this speed.
        var speed = 100;
		
        if (cursors.up.isDown) player.body.velocity.y = -speed;
        else if (cursors.down.isDown) player.body.velocity.y = speed;
        else player.body.velocity.y = 0;

        if (cursors.left.isDown) player.body.velocity.x = -speed;
        else if (cursors.right.isDown) player.body.velocity.x = speed;
        else player.body.velocity.x = 0;

        // Our collision and sorting code again.
        game.physics.isoArcade().collide(isoGroup);
        game.iso().topologicalSort(isoGroup);
	}
	
	private function render ():Void {
		game.debug.text("Move with cursors, jump with space!", 2, 36, "#ffffff");
		game.debug.text(Std.string(game.time.fps), 2, 14, "#a7aebe");
	}
	
}