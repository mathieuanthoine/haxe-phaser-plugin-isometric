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
		this.game.load.image("tile","assets/tile.png");
		this.game.time.advancedTiming = true;
		this.game.plugins.add(new Phaser.Plugin.Isometric(this.game));
		this.game.iso.anchor.setTo(0.5,0.2);
	}
	,create: function() {
		this.isoGroup = this.game.add.group();
		this.spawnTiles();
		this.cursorPos = new Phaser.Plugin.Isometric.Point3();
	}
	,update: function() {
		var _g = this;
		this.game.iso.unproject(this.game.input.activePointer.position,this.cursorPos);
		this.isoGroup.forEach(function(tile) {
			var inBounds = tile.isoBounds.containsXY(_g.cursorPos.x,_g.cursorPos.y);
			if(!tile.selected && inBounds) {
				tile.selected = true;
				tile.tint = 8830938;
				_g.game.add.tween(tile).to({ isoZ : 4},200,Phaser.Easing.Quadratic.InOut,true);
			} else if(tile.selected && !inBounds) {
				tile.selected = false;
				tile.tint = 16777215;
				_g.game.add.tween(tile).to({ isoZ : 0},200,Phaser.Easing.Quadratic.InOut,true);
			}
		},this);
	}
	,render: function() {
		var _g = this;
		this.game.debug.text("Move your mouse around!",2,36,"#ffffff");
		this.game.debug.text(Std.string(this.game.time.fps),2,14,"#a7aebe");
		this.isoGroup.forEach(function(cube) {
			if(cube.inCamera) _g.game.debug.body(js.Boot.__cast(cube , Phaser.Sprite),null,true);
		},this);
	}
	,spawnTiles: function() {
		var tile;
		var xx = 0;
		var yy;
		while(xx < 256) {
			yy = 0;
			while(yy < 256) {
				tile = this.game.add.isoSprite(xx,yy,0,"tile",0,this.isoGroup);
				tile.anchor.set(0.5,0);
				yy += 38;
			}
			xx += 38;
		}
	}
	,__class__: Main
};
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js.Boot.__string_rec(s,"");
};
var js = {};
js.Boot = function() { };
js.Boot.__name__ = true;
js.Boot.getClass = function(o) {
	if((o instanceof Array) && o.__enum__ == null) return Array; else return o.__class__;
};
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
js.Boot.__interfLoop = function(cc,cl) {
	if(cc == null) return false;
	if(cc == cl) return true;
	var intf = cc.__interfaces__;
	if(intf != null) {
		var _g1 = 0;
		var _g = intf.length;
		while(_g1 < _g) {
			var i = _g1++;
			var i1 = intf[i];
			if(i1 == cl || js.Boot.__interfLoop(i1,cl)) return true;
		}
	}
	return js.Boot.__interfLoop(cc.__super__,cl);
};
js.Boot.__instanceof = function(o,cl) {
	if(cl == null) return false;
	switch(cl) {
	case Int:
		return (o|0) === o;
	case Float:
		return typeof(o) == "number";
	case Bool:
		return typeof(o) == "boolean";
	case String:
		return typeof(o) == "string";
	case Array:
		return (o instanceof Array) && o.__enum__ == null;
	case Dynamic:
		return true;
	default:
		if(o != null) {
			if(typeof(cl) == "function") {
				if(o instanceof cl) return true;
				if(js.Boot.__interfLoop(js.Boot.getClass(o),cl)) return true;
			}
		} else return false;
		if(cl == Class && o.__name__ != null) return true;
		if(cl == Enum && o.__ename__ != null) return true;
		return o.__enum__ == cl;
	}
};
js.Boot.__cast = function(o,t) {
	if(js.Boot.__instanceof(o,t)) return o; else throw "Cannot cast " + Std.string(o) + " to " + Std.string(t);
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
String.prototype.__class__ = String;
String.__name__ = true;
Array.__name__ = true;
var Int = { __name__ : ["Int"]};
var Dynamic = { __name__ : ["Dynamic"]};
var Float = Number;
Float.__name__ = ["Float"];
var Bool = Boolean;
Bool.__ename__ = ["Bool"];
var Class = { __name__ : ["Class"]};
var Enum = { };
Main.main();
})();
