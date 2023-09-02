extends Object
class_name FileUtils


static func get_files_from_folder(rootPath: String):
	var files = []
	var directories = []
	var dir = DirAccess.open(rootPath)

	if dir:
		dir.list_dir_begin()
		_add_dir_contents(dir, files, directories)
	else:
		push_error("An error occurred when trying to access the path.")

	return files

static func _add_dir_contents(dir: DirAccess, files: Array, directories: Array):
	var file_name = dir.get_next()
	
	while (file_name != ""):
		var path = dir.get_current_dir() + "/" + file_name.replace(".remap", "")
		
		if dir.current_is_dir():
			var subDir = DirAccess.open(path)
			subDir.list_dir_begin()
			directories.append(path)
			_add_dir_contents(subDir, files, directories)
		
		else:
			files.append(path)

		file_name = dir.get_next()

	dir.list_dir_end()
