package picotron;

#if lua
import lua.Table;

class Mouse {
	var x:Int;
	var y:Int;
	var button:Int;
	// some mice have two axis of scrolling i guess?
	var wheelX:Int;
	var wheelY:Int;

	public function new(x:Int, y:Int, button:Int, wheelX:Int, wheelY:Int) {
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
