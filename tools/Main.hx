package tools;

// MOST THE CODE HERE IS COPIED FROM https://github.com/SomeRanDev/reflaxe/blob/main/Run.hx, FULL CREDIT TO THEM!
import sys.io.File;
import haxe.io.Path;
import sys.FileSystem;

var commandRunDir:String = "";

function main() {
	final args = Sys.args();
	commandRunDir = args.splice(args.length - 1, 1)[0];
	switch (args[0].toLowerCase()) {
		case "help":
			trace("------------------------");
			trace("init -- only really adds one file that i cant add automatically on compile... dies");
		case "init":
			trace(getPath(""));
			copyDir("lib", getPath("lib"));
		case _:
			trace("invalid arg!");
	}
}

function makeDirIfNonExist(p:String) {
	if (!FileSystem.exists(p)) {
		FileSystem.createDirectory(p);
	}
}

function getPath(p:String) {
	return FileSystem.absolutePath(haxe.io.Path.join([commandRunDir, p]));
}

function copyDir(src:String, dest:String) {
	// Make directory
	makeDirIfNonExist(dest);

	// Copy files
	for (file in FileSystem.readDirectory(src)) {
		final filePath = Path.join([src, file]);
		var destFile = Path.join([dest, file]);
		if (FileSystem.isDirectory(filePath)) {
			copyDir(filePath, destFile);
		} else {
			final content = File.getContent(filePath);
			File.saveContent(destFile, content);
		}
	}
}
