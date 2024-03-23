package picotron;

// TODO: we shouldnt need this class, its silly.
class Window {
	// TODO: more attributes exist? possibly.
	public static function makeWindow(width:Float, height:Float, name:String):Dynamic {
		width = Math.floor(width);
		height = Math.floor(height);
		return untyped __lua__("window{title = name, width = width, height = height}");
	}
}
