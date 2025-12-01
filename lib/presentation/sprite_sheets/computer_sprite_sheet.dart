import 'package:walkdown/presentation/games/interfaces/i_sprites.dart';

/// Sprite sheet for computer decoration animation.
/// Loads 20 individual sprite files (pc_1_1.png through pc_1_20.png).
class ComputerSpriteSheet extends ISprites {
  /// Base path for computer sprite files (files are numbered: pc_1_1.png, pc_1_2.png, etc.)
  @override
  String get path => 'decorations/computer/pc_1_';

  /// Total number of sprite frames in the computer animation
  @override
  int get amount => 20;
}
