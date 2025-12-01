import 'package:bonfire/bonfire.dart';

/// This is for single-image sprite sheets with a grid layout (e.g., 4x4 grid of sprites).
/// For loading individual sprite files, use ISprites instead.
abstract class ISpriteSheet {
  /// Number of columns in the sprite sheet grid
  int get columns;

  /// Asset path to the sprite sheet image
  String get path;

  /// Number of rows in the sprite sheet grid
  int get rows;

  /// Loads the sprite sheet from the asset path and creates a grid-based sprite sheet
  Future<SpriteSheet> load() async {
    final image = await Flame.images.load(path);
    // Create sprite sheet by dividing the image into a grid
    return SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: columns,
      rows: rows,
    );
  }
}
