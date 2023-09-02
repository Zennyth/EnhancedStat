# :book: Enhanced Stat Manual

Welcome to the Enhanced Stat Manual! This manual will guide you through how to get the most out of the Enhanced Stat addon for Godot 4.1. Whether you are new to game development or a seasoned pro, this manual aims to provide you with a thorough understanding of how to efficiently manage stats and status effects in your game.

---

## :wave: Introduction

The Enhanced Stat addon is a comprehensive tool to manage game stats like Health, Mana, Speed, Attack Damage, etc., along with status effects such as buffs and debuffs. It uses the principles of reactive programming to ensure your stats are always up-to-date and easily manageable.

---

## :rocket: Getting Started

First, make sure you've followed the [Installation](/README.md#installation) instructions from the README file.

- Ensure that the addon is activated in your Godot project.
- Make sure the `enhanced_common` dependency is also activated.

---

## Resource Management
All resources whether they are `Stat`, `Stats` or `StatusEffect` are templates. It means, they will be duplicated at runtime by their `StatsManager` or `StatusEffectManager`, it ensures the uniqueness of each stat for each instance of scenes.
> For example, you don't want all of your enemies to share the same health bar !

---

We hope this manual helps you to effectively use the Enhanced Stat addon to enrich your game development experience. Happy coding! :smile: