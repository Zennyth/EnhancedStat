@tool
extends OptionButton


var stat_listener: StatListener

func initialize(_stat_listener: StatListener) -> void:
	stat_listener = _stat_listener


var items: Array[Dictionary] = []

func _ready() -> void:
	if stat_listener == null or stat_listener._stats_manager == null:
		return

	item_selected.connect(_on_item_selected)

	for property in ClassUtils.get_custom_classes_from_exported_properties(stat_listener._stats_manager):
		if property.name != "stats":
			continue
		
		var classes := ClassUtils.get_custom_classes_from_custom_class(property.hint_string)

		for i in len(classes):
			var custom_class = classes[i]
			var custom_class_name = custom_class.class.replace("Stat", "") 
			add_item(custom_class_name, i) if custom_class.icon == "" else add_icon_item(load(custom_class.icon) as Texture2D, custom_class_name, i) 
			items.append(custom_class)

			if stat_listener.stat_key != null and stat_listener.stat_key.resource_path == custom_class.path:
				select(i)




func _on_item_selected(index: int) -> void:
	var custom_class: Dictionary = items[index]
	stat_listener.stat_key = load(custom_class.path)