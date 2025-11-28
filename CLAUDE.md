# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter game project using the Bonfire game engine (v3.16.1). The game features a top-down 2D world with pathfinding-based player movement where the player taps a location and the character automatically navigates there using A* pathfinding.

## Development Commands

### Running the application
```bash
flutter run
```

### Building
```bash
# Android
flutter build apk

# iOS
flutter build ios

# Web
flutter build web

# macOS
flutter build macos
```

### Testing
```bash
# Run all tests
flutter test

# Run a specific test file
flutter test test/<test_file>.dart
```

### Code Analysis
```bash
# Run static analysis
flutter analyze

# Format code
flutter format lib/
```

### Managing Dependencies
```bash
# Get dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# Check for outdated packages
flutter pub outdated
```

## Architecture

### Game Engine (Bonfire)
The project is built on the Bonfire game engine, which provides:
- Game loop and rendering
- Sprite/animation management
- Collision detection via `BlockMovementCollision`
- World map system using Spritefusion format (JSON-based tile maps)
- Pathfinding system with A* algorithm
- Camera controls with configurable zoom

### Core Components

**Player Hierarchy:**
- `HumanPlayer` (lib/human_player.dart) - Base player class
  - Extends `SimplePlayer` from Bonfire
  - Mixin: `BlockMovementCollision` for collision detection
  - Configures sprite animations, size (24x24), speed (32 units/sec)
  - Sets up rectangle hitbox (half size, centered)

- `HumanPathFinding` (lib/human_path_finding.dart) - Player with pathfinding
  - Extends `HumanPlayer`
  - Mixins: `PathFinding` and `TapGesture`
  - Handles tap-to-move gameplay via `onTapDownScreen()`
  - Calls `moveToPositionWithPathFinding()` on tap

**Animation System:**
- `AnimationConfigs` (lib/animation_configs.dart) - Centralized animation configuration
  - Defines sprite animations for different directions (up/down/left/right)
  - Currently uses skeleton sprite for all states
  - Loaded from `assets/images/players/`

**Map Configuration:**
- Uses Spritefusion world map format
- Map file: `assets/images/Map.json` (187KB)
- Tile size: 16x16 pixels
- Player spawns at grid position (3, 3)
- Camera zoom calculated via `getZoomFromMaxVisibleTile()` to show 20 tiles

### Project Structure
```
lib/
├── main.dart                  # Entry point, launches PathFindingPage
├── path_finding_page.dart     # Main game widget, configures BonfireWidget
├── human_player.dart          # Base player class with collision
├── human_path_finding.dart    # Player with tap-to-move pathfinding
└── animation_configs.dart     # Sprite animation definitions

assets/
└── images/
    ├── Map.json              # Spritefusion world map
    └── players/              # Player sprite sheets
        └── skeleton_idle_strip6.png
```

## Key Implementation Details

### Adding New Player Animations
When adding directional animations, update `AnimationConfigs.oldManAnimation()`:
- Each direction needs idle and run variants (8 total states)
- Use `SpriteAnimation.load()` for sprite sheets
- Specify frame count, timing, and texture dimensions

### Modifying Pathfinding Behavior
The pathfinding is configured in `HumanPathFinding` constructor:
- `setupPathFinding(pathLineStrokeWidth: 2)` enables visual path debugging
- Override `moveToPositionWithPathFinding()` to customize pathfinding behavior
- Pathfinding respects collision boundaries from the map

### Working with Maps
- Maps are created in Spritefusion (external tool) and exported as JSON
- Map file must be declared in `pubspec.yaml` assets section
- Loaded via `WorldMapBySpritefusion(WorldMapReader.fromAsset())`
- Collision tiles in the map automatically block player movement

### Camera Configuration
Camera zoom is dynamically calculated based on:
- Context (screen dimensions)
- Tile size (16 pixels)
- Desired visible tiles (20 tiles in viewport)

Function: `getZoomFromMaxVisibleTile(context, tileSize, visibleTiles)`
