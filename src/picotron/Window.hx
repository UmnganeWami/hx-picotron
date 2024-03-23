package picotron;

// TODO: we shouldnt need this class, its silly.
class Window {
	// TODO: more attributes exist? possibly.
	public static function makeWindow(width:Int, height:Int, name:String):Dynamic {
		return untyped __lua__("window{title = name, width = width, height = height}");
	}
}
