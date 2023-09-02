## Computed Stats: The Building Blocks :building_construction:

Computed stats serve as the foundation for more complex stats in your game. These are base stats that define basic types like integers (`IntStat`), floating-point numbers (`FloatStat`), and boolean (`BoolStat`). Unlike other stat types, computed stats have a unique interface that allows them to be modified using `StatModifier`.

### Types of Computed Stats :abacus:

- **Int**: Used for whole numbers, like coins.

    ```gdscript
    extends IntStat
    class_name CoinStat
    ```

- **Float**: Utilized for fractions and real numbers, ideal for stats like Speed or Attack Speed.
  
    ```gdscript
    @icon("res://examples/icons/icons8-speed-24.png")
    extends FloatStat
    class_name SpeedStat
    ```

- **Bool**: Used for binary stats that can be either True or False, like a 'Controllable' status.
  
    ```gdscript
    @icon("res://examples/icons/icons8-puppet-24.png")
    extends BoolStat
    class_name ControllableStat
    ```