@tool
extends OptionButton


var stat_modifier: StatModifier

func initialize(_stat_modifier: StatModifier) -> void:
	stat_modifier = _stat_modifier


var items: Array[Dictionary] = []

func _ready() -> void:
	if stat_modifier == null:
		return

	item_selected.connect(_on_item_selected)

	var custom_class_modifier: String = ClassUtils.get_custom_class(stat_modifier).class

	var classes := ClassUtils.get_inheriters_from_class(custom_class_modifier.replace("Modifier", ""))
	for i in len(classes):
		var custom_class = classes[i]
		var custom_class_name = custom_class.class.replace("Stat", "") 

		add_item(custom_class_name, i) if custom_class.icon == "" else add_icon_item(load(custom_class.icon) as Texture2D, custom_class_name, i) 
		
		items.append(custom_class)

		if stat_modifier.stat_key != null and stat_modifier.stat_key.resource_path == custom_class.path:
			select(i)
			_on_item_selected(i)
	
	if selected <= 0:
		select(0)
		_on_item_selected(0)

func _on_item_selected(index: int) -> void:
	var custom_class: Dictionary = items[index]
	stat_modifier.stat_key = load(custom_class.path)
