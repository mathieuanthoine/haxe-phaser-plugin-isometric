package;

import phaser.core.Game;
import phaser.core.Group;
import phaser.Phaser;
import phaser.plugin.isometric.Isometric;
import phaser.plugin.isometric.IsoSprite;

using phaser.plugin.isometric.IsoUtils;

class Main 
{
		
	private var isoGroup:Group;
		
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
		
		// Set the global gravity for isoArcade().
       game.physics.isoArcade().gravity.setTo(0, 0, -500);
		
        // Let's make a load of cubes on a grid.
        spawnCubes();

        // Allow the user to spawn another set of cubes each time they click/tap.
        game.input.onDown.add(spawnCubes);		
	}
	
	private function update (): Void {
		// Just like Arcade Physics!
        game.physics.isoArcade().collide(isoGroup);

        // Ensure everything stays sorted as it moves about. We'll use advanced sorting here as we're dealing with z axis stuff.
        game.iso().topologicalSort(isoGroup);
	}
	
	private function render ():Void {
		game.debug.text("Click to spawn more cubes!", 2, 36, "#ffffff");
        game.debug.text(Std.string(game.time.fps), 2, 14, "#a7aebe");
		
        // Uncomment this to see the debug bodies.
        //isoGroup.forEach(function (currentCube) { game.debug.body(cast(currentCube,Sprite));},this);

		//isoGroup.forEach(function (cube) { if (cube.inCamera) game.debug.body(cast(cube, Sprite), null, true); },this );
		
		//game.debug.octree(game.physics.isoArcade().octree);
	}
	
	private function spawnCubes ():Void {
        var cube:IsoSprite;		
		
		var xx:Int = 256;
		var yy:Int;
		
		while (xx > 0) {
			yy = 256;
            while (yy>0) {
                // Create a cube using the new game.add.isoSprite factory method at the specified position.
                // The last parameter is the group you want to add it to (just like game.add.sprite)                
				cube = game.add.isoSprite(xx, yy, 400, 'cube', 0, isoGroup);
                cube.anchor.set(0.5);

				// Enable the physics body on this cube.
                game.physics.isoArcade().enable(cube);

                // Collide with the world bounds so it doesn't go falling forever or fly off the screen!
                cube.body.collideWorldBounds = true;

                // Add a full bounce on the x and y axes, and a bit on the z axis. 
                cube.body.bounce.set(1, 1, 0.2);

                // Send the cubes off in random x and y directions! Wheee!
                cube.body.velocity.setTo(game.rnd.integerInRange(-50, 50), game.rnd.integerInRange(-50, 50), 0);
				
				yy -= 64;
			}
			xx -= 64;
			
        }

    }
	
}