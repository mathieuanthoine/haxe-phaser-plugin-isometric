(function () { "use strict";
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var Main = function() {
	this.sortModes = ["None","Simple","Topological"];
	this.sorted = 0;
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
		this.game.iso.anchor.setTo(0.5,0.2);
	}
	,create: function() {
		this.isoGroup = this.game.add.group();
		var cube;
		var xx = 256;
		var yy;
		while(xx > 0) {
			yy = 256;
			while(yy > 0) {
				cube = new MyIsoSprite(this.game,xx,yy,0,"cube",0);
				this.game.add.existing(cube);
				this.isoGroup.add(cube);
				cube.oldZ = cube.z;
				this.game.add.tween(cube).to({ isoX : 256 - xx + 32},2000,Phaser.Easing.Quadratic.InOut,true,0,Math.POSITIVE_INFINITY,true);
				yy -= 48;
			}
			xx -= 48;
		}
		this.game.input.onDown.add($bind(this,this.onDown));
	}
	,onDown: function() {
		this.sorted = (this.sorted + 1) % 3;
	}
	,update: function() {
		if(this.sorted == 0) this.isoGroup.sort("oldZ"); else if(this.sorted == 1) this.game.iso.simpleSort(this.isoGroup); else this.game.iso.topologicalSort(this.isoGroup);
	}
	,render: function() {
		this.game.debug.text("Click to toggle! Sort mode: " + this.sortModes[this.sorted],2,36,"#ffffff");
		this.game.debug.text(Std.string(this.game.time.fps),2,14,"#a7aebe");
	}
};
Math.__name__ = true;
var MyIsoSprite = function(game,x,y,z,key,frame) {
	Phaser.Plugin.Isometric.IsoSprite.call(this,game,x,y,z,key,frame);
	this.anchor.set(0.5);
};
MyIsoSprite.__name__ = true;
MyIsoSprite.__super__ = Phaser.Plugin.Isometric.IsoSprite;
MyIsoSprite.prototype = $extend(Phaser.Plugin.Isometric.IsoSprite.prototype,{
});
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
Math.NaN = Number.NaN;
Math.NEGATIVE_INFINITY = Number.NEGATIVE_INFINITY;
Math.POSITIVE_INFINITY = Number.POSITIVE_INFINITY;
Math.isFinite = function(i) {
	return isFinite(i);
};
Math.isNaN = function(i1) {
	return isNaN(i1);
};
String.__name__ = true;
Array.__name__ = true;
Main.main();
})();

//# sourceMappingURL=IsoPhaser.js.map