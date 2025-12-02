import 'package:bonfire/bonfire.dart';

/// Interface for building sprite animations from sprite sheets.
/// Provides a consistent way to configure and load sprite animations.
abstract class ISpriteSheetReader {
  /// Number of frames in the sprite sheet
  int get amount;

  SpriteSheet get spriteSheet;

  bool get vertical;

  int get startRow;

  int get startCol;

  /// Duration of each frame in seconds
  double get stepTime => 0.1;

  SpriteAnimation get animation => SpriteAnimation.spriteList(
    List.generate(
      amount,
      (index) => spriteSheet.getSprite(
        vertical ? startRow + index : startRow,
        vertical ? startCol : startCol + index,
      ),
    ),
    stepTime: stepTime,
  );
}
