# Walkdown

A walk-around portfolio built as a top-down 2D game with Flutter and [Bonfire](https://bonfire-engine.github.io). Tap anywhere and your villager pathfinds there; walk into **Project Hall**, chat with the boy who greets you, and tap the computers to open Trey's apps (starting with the Gift Grab web game).

## Features

- **Tap-to-move**: the player (`PlayerPathFinder`) uses Bonfire's A* pathfinding to walk to wherever you tap, routing around walls and furniture.
- **Two maps**: an outdoor world and the inside of a house (Project Hall), built in [Sprite Fusion](https://www.spritefusion.com) and loaded from JSON (`lib/data/enums/map_json.dart`).
- **Doors**: `Entrance` decorations swap maps when you're standing next to one and tap it, and place you at the right spot on the new map.
- **NPC dialogue**: `BoyNpc` welcomes you with a `TalkDialog` and his face portrait.
- **Interactive computers**: `ComputerDecoration` turns on when you're nearby, describes the app, asks for confirmation (shadcn dialog) and opens its URL, for example `https://giftgrab.codemagic.app/`.
- Animated sprites for the villager, the boy NPC, a skeleton and the computers, read from sprite sheets with direction-aware idle/run states.

## How it works

`lib/main.dart` provides a `MapCubit`, `LaunchService` and `ModalService`, then shows `WalkdownGame`. `WalkdownGame` (`lib/presentation/games/walkdown_game.dart`) rebuilds a `BonfireWidget` whenever `MapCubit` changes map, loading `WorldMapBySpritefusion` from the current map's JSON and registering map objects (entrances, computers, NPCs) by name. The camera zoom is set so about 25 tiles (16 px each) are visible.

```
lib/
├── main.dart
├── data/                       # globals (tile size), overlays, gap sizes, MapJson enum
├── domain/services/            # LaunchService (url_launcher), ModalService (shadcn dialogs)
└── presentation/
    ├── games/                  # WalkdownGame
    ├── cubits/map/             # MapCubit: current map + player start position
    ├── components/             # players, npcs, decorations (entrance, computer)
    ├── animations/             # per-character animation definitions
    ├── sprite_sheets/          # sprite sheet readers
    └── extensions/             # tile-grid helpers such as (x, y).plot
assets/images/
├── map_world/, house_1/        # Sprite Fusion maps and tiles
├── players/                    # villager, boy and skeleton sheets + faceset
└── decorations/computer/
```

## Tech stack

- Flutter, Dart `^3.10.0`
- `bonfire` 3.16, `flame_lint`
- `flutter_bloc` (MapCubit), `equatable`
- `shadcn_ui`, `google_fonts`, `url_launcher`, `logger`

## Getting started

```sh
flutter pub get
flutter run            # add -d chrome, -d macos, -d windows, etc.
```

Build for a platform with `flutter build apk | ios | web | macos | windows`. A Windows MSIX build of version 25.11.1+2 is in `dist/`.

To edit a map, open its JSON in Sprite Fusion, export it back to `assets/images/<map>/map.json`, and keep the object names that `WalkdownGame` looks for.

## Testing

```sh
flutter analyze
flutter test
```

`test/` holds the default widget test.
