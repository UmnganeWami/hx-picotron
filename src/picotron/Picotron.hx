package picotron;

#if lua
@:native("")
extern class Picotron {
	public static var _update:Void->Void;
	public static var _draw:Void->Void;
	public static var _init:Void->Void;
	// @:native("trace")
	// public static function Ptrace(stuff:String):Void;
	// idk if anyone'll *really* use this, but meh.
	public static function include(filePath:String):Void;
	// public static function print(thing:Dynamic, ?x:Float = 0, ?y:Float = 0, ?col:Int = 1):Void;
	public static inline function print(thing:Dynamic, ?x:Float = null, ?y:Float = null, ?col:Int = null):Void {
		if (!(thing is String)) {
			thing = Std.string(thing);
		}
		INTERNAL_Picotron.print(thing, x, y, col);
	}
	public static function cls(col:Int):Void;

	// TODO: currently, its put in its own, non extern class, for some shitty workaround, i'll figure it out later.
	// public static function window(width:Int, height:Int, attribs:Dynamic = null):Void;
	public static function t():Float;
	public static function time():Float;
	// TODO: wtf is src?
	// its either an index, currently loaded sprites, or USERDATA stuffs.
	// NEW TODO: idk, maybe overloads?
	public static function sspr(src:Dynamic, x0:Int, y0:Int, w0:Int, h0:Int, x1:Int, y1:Int, ?w1:Int, ?w2:Int):Void;
	public static function spr(index:Int, x:Int, y:Int):Void;

	public static function circ(x:Int, y:Int, r:Int, ?col:Int = 0):Void;
	public static function circfill(x:Int, y:Int, r:Int, ?col:Int = 0):Void;

	public static function oval(x0:Int, y0:Int, x1:Int, y1:Int, ?col:Int = 0):Void;
	public static function ovalfill(x0:Int, y0:Int, x1:Int, y1:Int, ?col:Int = 0):Void;

	public static function rect(x0:Int, y0:Int, x1:Int, y1:Int, ?col:Int = 0):Void;
	public static function rectfill(x0:Int, y0:Int, x1:Int, y1:Int, ?col:Int = 0):Void;

	public static function sfx(index:Int):Void;
	public static function music(index:Int):Void;

	public static function btn(index:Int):Bool;
	public static function btnp(index:Int):Bool;

	public static function key(keyName:String):Bool;
	public static function keyp(keyName:String):Bool;

	public static function map(x:Int, y:Int):Void;

	public static function mv(src:String, dest:String):Void;
	public static function cp(src:String, dest:String):Void;
	public static function cd(dir:String):Void;

	public static function map(x:Int, y:Int);
	public static function camera(x:Int, y:Int);
	/*public static function ls(dir:String):lua.Table<Int, Dynamic>;
		@:native("ls")
		public static function dir(dir:String):lua.Table<Int, Dynamic>; 
	 */
}

@:native("")
extern class INTERNAL_Picotron {
	public static function print(thing:Dynamic, ?x:Float = null, ?y:Float = null, ?col:Int = null):Void;
}
#end
