package picotron;

#if lua
import lua.Table;

class FileSystem {
	public static function ls(dir:String):Array<String> {
		var dirAt:Table<Int, Dynamic> = INTERNAL_FileSystem.ls("/appdata");
		return Table.toArray(dirAt);
	}

	public static function dir(dir:String):Array<String> {
		return ls(dir);
	}

	public static function rm(dir:String):Void {
		INTERNAL_FileSystem.rm(dir);
	}

	public static function mv(src:String, dest:String):Void {
		INTERNAL_FileSystem.mv(src, dest);
	}

	public static function cp(src:String, dest:String):Void {
		INTERNAL_FileSystem.cp(src, dest);
	}

	public static function cd(dir:String):Void {
		INTERNAL_FileSystem.cd(dir);
	}

	public static function store(dir:String):Void {
		INTERNAL_FileSystem.store(dir);
	}

	public static function fetch(dir:String):String {
		return INTERNAL_FileSystem.fetch(dir);
	}

	public static function include(dir:String) {
		include(dir);
	}
}

// a class to hold the extern versions of the functions, just so that we can have normal functions within the actual class.

@:native("")
extern class INTERNAL_FileSystem {
	public static function ls(dir:String):lua.Table<Int, Dynamic>;
	public static function mv(src:String, dest:String):Void;
	public static function rm(dir:String):Void;
	public static function cp(src:String, dest:String):Void;
	public static function cd(dir:String):Void;
	public static function store(dir:String):Void;
	public static function fetch(dir:String):String;
	// idk if anyone'll *really* use this, but meh.
	public static function include(filePath:String):Void;
}
#end
