## Aggregated Stats: The Composite Architecture :chart_with_upwards_trend:

Aggregated stats are a powerful feature in Enhanced Stat, allowing you to create complex stat structures from simpler computed stats. These stats manage multiple `ComputedStat` instances, distributing modifiers and calculations across them. In this section, we'll focus on `PoolStat` and `GrowableStat`, which are two core types of aggregated stats.

Both have their implemented version of `Int` and `Float` class.

---

### PoolStat: Min, Max, and Is_Infinite :swimming_woman:

The `PoolStat` class is made up of three main computed stats:

- **Min**: The minimum `NumberStat` that the value can have.
- **Max**: The maximum `NumberStat` that the value can reach.
- **Is_Infinite**: A `BoolStat` indicating whether the value can change.

#### How to Use PoolStat:

```gdscript
@icon("res://examples/icons/icons8-heart-24.png")
extends IntPoolStat
class_name HealthStat
```

#### Interface:

The `PoolStat` class has an interface that allows you to modify each of its constituent computed stats individually.

- Signals: `depleted`, `replenished`, `increased(value, amount)`, `decreased(value, amount)`
- Methods: `deplete()`, `replenish()`, `increase(amount)`, `decrease(amount)`

### GrowableStat: Leveling Up :arrow_up:

The `GrowableStat` class is based on `PoolStat` but provides additional functionality for growing a stat when its value reaches the max value. This is especially useful for stats like XP or Mana that may need to be expanded over time.

#### How to Use GrowableStat:

```gdscript
extends IntGrowableStat
class_name LevelStat
```

#### Interface:

The `GrowableStat` class provides additional methods to handle growth.

- `grow()`: Increases the `max_value` and resets the current value.

### AggregatedStat and StatModifiers :wrench:

The `AggregatedStat` class is designed to handle `StatModifiers` elegantly by distributing them to the right computed stats.

For example, if you have a `StatModifier` that is meant to increase the Max Health of an entity, `AggregatedStat` will automatically route that modifier to the `max` computed stat of a `PoolStat`.

---

By combining computed stats into aggregated stats like `PoolStat` and `GrowableStat`, you can manage intricate gameplay mechanics and systems with ease. These classes provide a flexible and robust framework for all kinds of stat-based game features. :game_die: