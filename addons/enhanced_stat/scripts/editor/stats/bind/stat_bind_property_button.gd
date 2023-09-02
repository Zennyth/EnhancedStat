@tool
extends OptionButton


var stat_bind: AbstractStatBind

func initialize(_stat_bind: AbstractStatBind) -> void:
	stat_bind = _stat_bind


var items: Array[Dictionary] = []

func _ready() -> void:
	if stat_bind == null or stat_bind.target == null:
		return

	item_selected.connect(_on_item_selected)
	items = stat_bind.target.get_property_list().filter(func(p: Dictionary): return !p.name.contains(".gd"))
	items.reverse()
	
	for i in len(items):
		add_item(items[i].name)

		if stat_bind.property_to_bind != null and stat_bind.property_to_bind == items[i].name:
			select(i)
	




func _on_item_selected(index: int) -> void:
	var property: Dictionary = items[index]
	stat_bind.property_to_bind = property.name 