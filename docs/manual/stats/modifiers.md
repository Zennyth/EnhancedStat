## Basic Interface :gear:

The computed stats come with a set of functions to make it easy to compute their values, particularly when using `StatModifier`.

### Methods:

- `compute()`: Calculates the current value of the stat based on all the attached modifiers.
  
  ```gdscript
  health.compute()
  ```

- `add_stat_modifier(stat_modifier: StatModifier) -> void`: Adds a modifier to the stat.
  
  ```gdscript
  health.add_stat_modifier(health_modifier)
  ```

- `remove_stat_modifier(stat_modifier: StatModifier) -> void`: Removes a specific modifier from the stat.
  
  ```gdscript
  health.remove_stat_modifier(health_modifier)
  ```

### Working with StatModifier :wrench:

The `StatModifier` is a class used to modify a computed stat. It contains a method that takes the stat's current value and returns a new value.

For example, a `StatModifier` for an `Int` stat might look like:

> PS. EnhancedStat has already implemented the basic modifier for you.

```gdscript
extends NumberStatModifier
class_name IntStatModifier

@export var operation_value: int = 0

func get_operation_value() -> int:
	return operation_value

func apply(value: int, stat: IntStat):
	return super(value, stat)
```

To use this `StatModifier` with a computed stat:

```gdscript
var add_health_modifier = IntStatModifier.new()
health.add_stat_modifier(add_health_modifier) # health is a Computed stats
```

Now, whenever you call `compute()` on `health`, it will add 10 to its value. Note that whenever you add or remove a modifier to a stat, compute will automatically be called to update the stat.

```gdscript
health.compute()  # if initial value was 100, it becomes 110
```

---

By understanding computed stats and their interfaces, you can create powerful, dynamic stats that change in real-time based on game events, user inputs, or any other criteria you set. This makes your game more engaging and allows for intricate gameplay mechanics. :video_game:
