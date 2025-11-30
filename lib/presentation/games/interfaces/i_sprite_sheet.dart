import 'package:bonfire/bonfire.dart';

/// Interface for loading sprite sheets from image assets.
/// Defines the grid structure and provides a method to load the sprite sheet.
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
    return SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: columns,
      rows: rows,
    );
  }
}
