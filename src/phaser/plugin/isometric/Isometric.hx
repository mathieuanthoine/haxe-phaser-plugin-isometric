/**
* The MIT License (MIT)

* Copyright (c) 2014 Lewis Lane

* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*
* 
*
*/

/**
 * @author       Javascript: Lewis Lane <lew@rotates.org>
 * @author		 Haxe externs: Mathieu Anthoine <anthoine.mathieu@gmail.com>
 * @copyright    2014 Lewis Lane (Rotates.org)
 * @license      {@link http://opensource.org/licenses/MIT|MIT License}
 */
 
package phaser.plugin.isometric;

import phaser.core.Game;
import phaser.core.Group;

@:native("Phaser.Plugin.Isometric")
extern class Isometric {
	/**
	 * Isometric is a comprehensive axonometric plugin for Phaser which provides an API for handling axonometric projection of assets in 3D space to the screen.
	 * The goal has been to mimic as closely as possible the existing APIs provided by Phaser for standard orthogonal 2D projection, but add a third dimension.
	 * Also included is an Arcade-based 3D AABB physics engine, which again is closely equivalent in functionality and its API.
	 * @param game The current game instance.
	 */
	public function new (game:Game, ?parent:Dynamic);

	static var VERSION:String;

	// Directional consts
	static var UP:UInt;
	static var DOWN:UInt;
	static var FORWARDX:UInt;
	static var FORWARDY:UInt;
	static var BACKWARDX:UInt;
	static var BACKWARDY:UInt;

	// Type consts
	static var ISOSPRITE:Float;
	static var ISOARCADE:Float;
	
	// Projection angles
	// in Projector.js file
	static var CLASSIC:Float;
	static var ISOMETRIC:Float;
	static var MILITARY:Float;
	
}