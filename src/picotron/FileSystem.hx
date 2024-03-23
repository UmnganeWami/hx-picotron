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
}

@:native("")
extern class INTERNAL_FileSystem {
	public static function ls(dir:String):lua.Table<Int, Dynamic>;
}
#end
