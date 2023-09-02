# Managing Stats

Managing stats effectively is crucial in game development, and Enhanced Stat provides several classes to help you with this. Below is an in-depth guide to manage stats through the classes provided: Stat, Stats, and StatsManager.

---

## Classes
These classes work in conjunction to provide a comprehensive way to manage game stats and are designed to make it as flexible and robust as possible. Feel free to dig into each class and explore their methods and properties to best fit your game's needs!

---

### :bookmark: Stat (Extends Resource)
The Stat class is used for representing individual stats, like Health, Mana, Speed, etc. As it inherits from Godot's Resource, it is easily serializable and can be shared among multiple instances or saved for later.

### :bookmark_tabs: Stats (Extends Resource)
The Stats class is essentially a container for Stat objects. It is useful when you have an entity that has multiple stats, like a character in an RPG who has health, mana, strength, etc.

### :gear: StatsManager (Extends Node)
The StatsManager class provides an interface to manage Stats and is typically attached to the entity that owns those stats. This makes it easier to access and manipulate stats during gameplay.