# ✨ Enhanced Stat for Godot 4.1

[![Godot Version](https://img.shields.io/badge/Godot-4.1-brightgreen.svg)](https://godotengine.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Static Badge](https://img.shields.io/badge/Doc-0.0.1-blue)](https://zennyth.github.io/EnhancedStat/)

---

## 🔍 Table of Contents

- [✨ Enhanced Stat for Godot 4.1](#-enhanced-stat-for-godot-41)
  - [🔍 Table of Contents](#-table-of-contents)
  - [📖 Overview](#-overview)
  - [📦 Installation](#-installation)
  - [🚀 Features](#-features)
    - [📈 Stats](#-stats)
    - [⚡ Status Effects](#-status-effects)
    - [💻 Editor Friendly](#-editor-friendly)
  - [🔗 Dependencies](#-dependencies)
  - [📁 Project Architecture](#-project-architecture)
  - [📗 Usage](#-usage)
  - [📝 Documentation](#-documentation)
  - [🍻 Contributing](#-contributing)
  - [📄 License](#-license)

---

## 📖 Overview

**Enhanced Stat** is an addon suite for Godot 4.1, designed to provide an intuitive and powerful way to manage stats in games such as Health, Mana, Speed, and Attack Damage. This addon is part of the **Enhanced** suite aimed to make your Godot development faster, cleaner, and more enjoyable!

---

## 📦 Installation

1. Clone or download the repository.
2. Copy the `enhanced_stat` folder inside your project's `addons` directory.
3. Enable the addon by going to `Project -> Project Settings -> Plugins` and activating the "Enhanced Stat" plugin.

---

## 🚀 Features

### 📈 Stats

- **Reactive Programming**: Stats are reactive, and changes can be listened to in real-time.
- **Computed Stats**: Type safe basic stats.
- **Aggregated Stats**: Create new stats based on existing stats, automatically updating when dependencies change.
- **Bind Mechanism**: Allows easy binding of stats to in game nodes.
- **Modifiers**: Flexible modification of stats through addition, multiplication, or other custom methods.
- **Listeners**: Events to notify game logic of stats changes.

### ⚡ Status Effects

- **Component-based**: Reusable components that can be combined to create complex status effects.
- **Modifiers**: Attachable to stats to create temporary or permanent changes.
- **Vfx**: Add vfxs or nodes while the status effect is active.

### 💻 Editor Friendly

- **Editor Inspector**: Use the editor to configure the stats and status effects for your game. 

---

## 🔗 Dependencies

- **Enhanced Common**: This addon depends on the [enhanced_common](https://github.com/Zennyth/EnhancedCommon) addon for various utilities and common functionalities. Make sure to also have this addon installed and enabled.

---

## 📁 Project Architecture

Here is an overview of the project's file hierarchy:

```
- enhanced_stat
    +---addons
        +---enhanced_common
        +---enhanced_stat
            +---icons
            +---scenes
                +---editor
                    +---stats
                        +---bind
                        +---listeners
                        +---modifier
            +---scripts
                +---editor
                    +---stats
                        +---bind
                        +---listeners
                        +---modifier
                +---core
                    +---stats
                        +---bind
                        +---listeners
                        +---modifier
                        +---stat
                    +---status_effects
                        +---components
```

---

## 📗 Usage

Check the [documentation](https://zennyth.github.io/EnhancedStat/) for tutorials, API references, and examples to get started. Usage is straightforward and can easily be integrated into your existing Godot project.

---

## 📝 Documentation

Further documentation is available in the `docs` directory. 
You can also check the inline comments for a more detailed understanding of specific methods and functionalities.

---

## 🍻 Contributing

Contributions are very welcome! Feel free to open issues or submit pull requests.

---

## 📄 License

This project is licensed under the terms of the MIT license. See [LICENSE](LICENSE) for details.
This project uses icons from [icons8](https://icons8.com/license). If you fancy those lovely icons, please check out their [website](https://icons8.com/icon/set/logos/material).

---

Made with ❤️ for the Godot community. Happy coding! :smile:
