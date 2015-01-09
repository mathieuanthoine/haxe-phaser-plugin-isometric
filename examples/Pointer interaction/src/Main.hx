package;

import phaser.core.Game;
import phaser.core.Group;
import phaser.gameobjects.Sprite;
import phaser.Phaser;
import phaser.plugin.isometric.Isometric;
import phaser.plugin.isometric.IsoSprite;
import phaser.plugin.isometric.Point3;
import phaser.tween.Easing;

using phaser.plugin.isometric.IsoUtils;

class Main 
{
	
	private var isoGroup:Group;
	
	private var cursorPos:Point3;

	private var cursor:Dynamic;
		
	static function main ():Void {
		new Main();
	}
	
	public var game:Game;
	
	private function new () {
		game = new Game(800, 400, Phaser.AUTO, 'test', { preload: preload, create: create, update:update, render:render });
	}
	
	private function preload(): Void {
		game.load.image("tile", "assets/tile.png");
		
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
		
		// Let's make a load of tiles on a grid.
        spawnTiles();

        // Provide a 3D position for the cursor
        cursorPos = new Point3();				
	}
	
	private function update (): Void {
        // Update the cursor position.
        // It's important to understand that screen-to-isometric projection means you have to specify a z position manually, as this cannot be easily
        // determined from the 2D pointer position without extra trickery. By default, the z position is 0 if not set.
        game.iso().unproject(game.input.activePointer.position, cursorPos);

        // Loop through all tiles and test to see if the 3D position from above intersects with the automatically generated IsoSprite tile bounds.
        isoGroup.forEach(function (tile) {
            var inBounds = tile.isoBounds.containsXY(cursorPos.x, cursorPos.y);
            // If it does, do a little animation and tint change.
            if (!tile.selected && inBounds) {
                tile.selected = true;
                tile.tint = 0x86bfda;
                game.add.tween(tile).to({ isoZ: 4 }, 200, Quadratic.InOut, true);
            }
            // If not, revert back to how it was.
            else if (tile.selected && !inBounds) {
                tile.selected = false;
                tile.tint = 0xffffff;
                game.add.tween(tile).to({ isoZ: 0 }, 200, Quadratic.InOut, true);
            }
        },this);
	}
	
	private function render ():Void {
        game.debug.text("Move your mouse around!", 2, 36, "#ffffff");
		game.debug.text(Std.string(game.time.fps), 2, 14, "#a7aebe");
	
		isoGroup.forEach(function (cube) { if (cube.inCamera) game.debug.body(cast(cube, Sprite), null, true); },this );
		
	}
	
	private function spawnTiles ():Void {
        var tile:IsoSprite;		
		
		var xx:Int = 0;
		var yy:Int;
		
		while (xx < 256) {
			yy = 0;
            while (yy<256) {
                // Create a cube using the new game.add.isoSprite factory method at the specified position.
                // The last parameter is the group you want to add it to (just like game.add.sprite)                
				tile = game.add.isoSprite(xx, yy, 0, 'tile', 0, isoGroup);
                tile.anchor.set(0.5,0);
				yy += 38;
			}
			xx += 38;	
        }
	}
	
}