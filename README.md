# Visuals Editor

![Preview](https://raw.githubusercontent.com/hiraeeth/Visuals-Editor/main/preview.gif)

## Overview

A visuals manager for gamesense that provides seamless management of visual settings through clipboard sharing and local storage. Streamlined interface for importing, exporting, and organizing your visual configurations.

**Key Capabilities:**

- Local config management
- Clipboard-based config sharing
- Multi-category visual settings control
- Real-time config switching

## Features

### Configs

- Save/Load ESP presets locally
- Delete existing configs
- Searchable config list
- Double-click config import

### Clipboard

- Export selected settings as base64-encoded string
- Import configs from clipboard
- Version compatibility checks

### Supported Categories

- Player ESP
- Colored Models
- Other ESP
- Visual Effects
- Menu

### Modules

The Visuals Editor now includes a modular system that allows you to extend functionality with additional visual enhancements:

- **Easy Installation**: One-click download for available modules
- **Toggle Modules**: Double-click to load/unload modules
- **Persistent Settings**: Module states are saved between sessions

#### Available Modules

- **esp_healthbar**: Custom health bar with gradient options
- **esp_remap**: Enhanced visual remapping capabilities
- **esp_skybox**: Custom skybox with additional configuration options
- **esp_fog**: Advanced fog configuration and skybox fog controls
- **esp_bloom**: Enhanced bloom effects with custom wall coloration, exposure, and model brightness settings

When modules are loaded, their settings are automatically included in your exported configs, ensuring a complete visual experience when sharing with others.

### Dependencies

Pre-dumped dependencies are included, but you can also download them directly from the official links below if preferred

- [gamesense/clipboard](https://gamesense.pub/forums/viewtopic.php?id=28678)
- [gamesense/base64](https://gamesense.pub/forums/viewtopic.php?id=21619)
- [gamesense/http](https://gamesense.pub/forums/viewtopic.php?id=19253) - Required for module downloads

## Installation

1. Subscribe to all required dependencies
2. Place the script in your gamesense Lua scripts folder
3. Load the script from the gamesense menu
4. Access the Visuals Editor from the Lua tab

## Tips

- Use the multi-select to choose which categories to include when saving/exporting
- Double-click on config names to instantly load them
- Double-click on module names to toggle them on/off
- Look for the [✓] indicator to see which modules are currently loaded
- Look for the [+] indicator to see which modules need to be downloaded
