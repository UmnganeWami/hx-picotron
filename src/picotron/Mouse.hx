package picotron;

#if lua
import lua.Table;

class Mouse {
	var x:Float;
	var y:Float;
	var button:Int;
	// some mice have two axis of scrolling i guess?
	var wheelX:Float;
	var wheelY:Float;

	public function new(x:Float, y:Float, button:Int, wheelX:Float, wheelY:Float) {
		this.x = x;
		this.y = y;
		this.button = button;
		this.wheelX = wheelX;
		this.wheelY = wheelY;
	}

	public static function getMouse():Mouse {
		untyped __lua__("local mx,my,mb,wx,wy = mouse()");
		var mStuff:Table<Dynamic, Dynamic> = untyped __lua__("{x = mx, y = my, button = mb, wheelX = wx, wheelY = wy}");
		var mStuffMap:Map<String, Dynamic> = Table.toMap(mStuff);
		return new Mouse(mStuffMap.get("x"), mStuffMap.get("y"), mStuffMap.get("button"), mStuffMap.get("wheelX"), mStuffMap.get("wheelY"));
	}

	public function toString() {
		return '$x, $y, $button, $wheelX, $wheelY';
	}
}
#end
