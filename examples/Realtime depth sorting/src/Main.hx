package;

import phaser.core.Game;
import phaser.core.Group;
import phaser.Phaser;
import phaser.plugin.isometric.Isometric;
import phaser.tween.Easing;
import phaser.plugin.isometric.Point3;

using phaser.plugin.isometric.IsoUtils;

class Main 
{
	
	private var isoGroup:Group;
	
	private var sorted:Int=0;
	
	private var sortModes:Array<String> = ["None", "Simple", "Topological"];
	
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
		
		// This is used to set a game canvas-based offset for the 0, 0, 0 isometric coordinate - by default
        // this point would be at screen coordinates 0, 0 (top left) which is usually undesirable.
		game.iso().anchor.setTo (0.5, 0.2);
		
	}
	
	private function create (): Void {
		
		// Create a group for our tiles, so we can use Group.sort
		isoGroup = game.add.group();
		
		 // Let's make a load of cubes on a grid, but do it back-to-front so they get added out of order.
        var cube:MyIsoSprite;
		
		var xx:Int = 256;
		var yy:Int;
		
		while (xx > 0) {
			yy = 256;
            while (yy>0) {
                // Create a cube using the new game.add.isoSprite factory method at the specified position.
                // The last parameter is the group you want to add it to (just like game.add.sprite)
                
				cube = new MyIsoSprite(game, xx, yy, 0, "cube", 0);
				game.add.existing(cube);
				isoGroup.add(cube);
				
				// Store the old messed up ordering so we can compare the two later.
                cube.oldZ = cube.z;
								
				// Add a slightly different tween to each cube so we can see the depth sorting working more easily.
                game.add.tween(cube).to({ isoX: 256 - xx + 32}, 2000, Quadratic.InOut, true, 0,  Math.POSITIVE_INFINITY, true);
				
				yy -= 48;
			}
			xx -= 48;
			
        }
		
		// Toggle sorting on click/tap.
		game.input.onDown.add(onDown);
		
	}
	
	private function onDown (): Void {
		sorted = (sorted + 1) % 3;
	}
	
	private function update (): Void {
		if (sorted == 0) {
            isoGroup.sort('oldZ');
        }
        else if (sorted == 1) {
            game.iso().simpleSort(isoGroup);
        }
        else {
            game.iso().topologicalSort(isoGroup);
        }
	}
	
	private function render ():Void {
		game.debug.text("Click to toggle! Sort mode: " + sortModes[sorted], 2, 36, "#ffffff");
        game.debug.text(Std.string(game.time.fps), 2, 14, "#a7aebe");
	}
	
}