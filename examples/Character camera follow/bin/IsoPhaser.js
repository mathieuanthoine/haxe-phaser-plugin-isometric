(function () { "use strict";
var Main = function() {
	this.game = new Phaser.Game(800,400,Phaser.AUTO,"test",{ preload : $bind(this,this.preload), create : $bind(this,this.create), update : $bind(this,this.update), render : $bind(this,this.render)});
};
Main.__name__ = true;
Main.main = function() {
	new Main();
};
Main.prototype = {
	preload: function() {
		this.game.load.image("cube","assets/cube.png");
		this.game.time.advancedTiming = true;
		this.game.plugins.add(new Phaser.Plugin.Isometric(this.game));
		this.game.world.setBounds(0,0,2048,1024);
		this.game.physics.startSystem(Phaser.Plugin.Isometric.ISOARCADE);
		this.game.iso.anchor.setTo(0.5,0);
	}
	,create: function() {
		var _g = this;
		this.isoGroup = this.game.add.group();
		this.game.physics.isoArcade.gravity.setTo(0,0,-500);
		var cube;
		var xx = 1024;
		var yy;
		while(xx > 0) {
			yy = 1024;
			while(yy > 0) {
				cube = this.game.add.isoSprite(xx,yy,0,"cube",0,this.isoGroup);
				cube.anchor.set(0.5);
				this.game.physics.isoArcade.enable(cube);
				cube.body.collideWorldBounds = true;
				cube.body.bounce.set(1,1,0.2);
				cube.body.drag.set(100,100,0);
				yy -= 140;
			}
			xx -= 140;
		}
		this.player = this.game.add.isoSprite(128,128,0,"cube",0,this.isoGroup);
		this.player.tint = 8830938;
		this.player.anchor.set(0.5);
		this.game.physics.isoArcade.enable(this.player);
		this.player.body.collideWorldBounds = true;
		this.cursors = this.game.input.keyboard.createCursorKeys();
		this.game.input.keyboard.addKeyCapture([Phaser.Keyboard.LEFT,Phaser.Keyboard.RIGHT,Phaser.Keyboard.UP,Phaser.Keyboard.DOWN,Phaser.Keyboard.SPACEBAR]);
		var space = this.game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);
		space.onDown.add(function() {
			_g.player.body.velocity.z = 300;
		});
		this.game.camera.follow(this.player);
	}
	,update: function() {
		var speed = 100;
		if(this.cursors.up.isDown) this.player.body.velocity.y = -speed; else if(this.cursors.down.isDown) this.player.body.velocity.y = speed; else this.player.body.velocity.y = 0;
		if(this.cursors.left.isDown) this.player.body.velocity.x = -speed; else if(this.cursors.right.isDown) this.player.body.velocity.x = speed; else this.player.body.velocity.x = 0;
		this.game.physics.isoArcade.collide(this.isoGroup);
		this.game.iso.topologicalSort(this.isoGroup);
	}
	,render: function() {
		this.game.debug.text("Move with cursors, jump with space!",2,36,"#ffffff");
		this.game.debug.text(Std.string(this.game.time.fps),2,14,"#a7aebe");
	}
};
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js.Boot.__string_rec(s,"");
};
var js = {};
js.Boot = function() { };
js.Boot.__name__ = true;
js.Boot.__string_rec = function(o,s) {
	if(o == null) return "null";
	if(s.length >= 5) return "<...>";
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) t = "object";
	switch(t) {
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) return o[0];
				var str = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i = _g1++;
					if(i != 2) str += "," + js.Boot.__string_rec(o[i],s); else str += js.Boot.__string_rec(o[i],s);
				}
				return str + ")";
			}
			var l = o.length;
			var i1;
			var str1 = "[";
			s += "\t";
			var _g2 = 0;
			while(_g2 < l) {
				var i2 = _g2++;
				str1 += (i2 > 0?",":"") + js.Boot.__string_rec(o[i2],s);
			}
			str1 += "]";
			return str1;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString) {
			var s2 = o.toString();
			if(s2 != "[object Object]") return s2;
		}
		var k = null;
		var str2 = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str2.length != 2) str2 += ", \n";
		str2 += s + k + " : " + js.Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str2 += "\n" + s + "}";
		return str2;
	case "function":
		return "<function>";
	case "string":
		return o;
	default:
		return String(o);
	}
};
var phaser = {};
phaser.plugin = {};
phaser.plugin.isometric = {};
phaser.plugin.isometric.IsoUtils = function() { };
phaser.plugin.isometric.IsoUtils.__name__ = true;
phaser.plugin.isometric.IsoUtils.octree = function(obj,octree,color) {
	if(color == null) color = "rgba(255,0,0,0.3)";
	return obj.octree(octree,color);
};
phaser.plugin.isometric.IsoUtils.iso = function(obj) {
	return obj.iso;
};
phaser.plugin.isometric.IsoUtils.isoArcade = function(obj) {
	return obj.isoArcade;
};
phaser.plugin.isometric.IsoUtilsGameObjectCreator = function() { };
phaser.plugin.isometric.IsoUtilsGameObjectCreator.__name__ = true;
phaser.plugin.isometric.IsoUtilsGameObjectCreator.isoSprite = function(obj,x,y,z,key,frame) {
	return obj.isoSprite(x,y,z,key,frame);
};
phaser.plugin.isometric.IsoUtilsGameObjectFactory = function() { };
phaser.plugin.isometric.IsoUtilsGameObjectFactory.__name__ = true;
phaser.plugin.isometric.IsoUtilsGameObjectFactory.isoSprite = function(obj,x,y,z,key,frame,group) {
	return obj.isoSprite(x,y,z,key,frame,group);
};
phaser.plugin.isometric.IsoUtilsDebug = function() { };
phaser.plugin.isometric.IsoUtilsDebug.__name__ = true;
phaser.plugin.isometric.IsoUtilsDebug.isoSprite = function(obj,sprite,color,filled) {
	if(filled == null) filled = true;
	if(color == null) color = "rgba(0,255,0,0.4)";
	return obj.isoSprite(sprite,color,filled);
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
String.__name__ = true;
Array.__name__ = true;
Main.main();
})();
