import 'package:bonfire/bonfire.dart';

/// Interface for loading individual sprite files sequentially.
/// Used for loading numbered sprite files (e.g., sprite_1.png, sprite_2.png, etc.)
/// This differs from ISpriteSheet which loads from a single grid-based sprite sheet.
abstract class ISprites {
  /// Asset path to the sprite files (without the number and extension)
  String get path;

  /// Number of sprite files to load
  int get amount;

  /// Loads all sprites from individual files
  Future<List<Sprite>> load() async {
    final sprites = <Sprite>[];

    // Load each sprite file sequentially (sprite_1.png, sprite_2.png, etc.)
    for (int i = 1; i < 1 + amount; i++) {
      final sprite = await Sprite.load('$path$i.png');
      sprites.add(sprite);
    }

    return sprites;
  }
}
