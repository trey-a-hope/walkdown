import 'package:bonfire/bonfire.dart';

/// Interface for building sprite animations from sprite sheets.
/// Provides a consistent way to configure and load sprite animations.
abstract class ISpriteBuilder {
  /// Number of frames in the sprite sheet
  int get amount;

  /// Builds and loads the animation from the sprite sheet
  Future<SpriteAnimation> get animation => SpriteAnimation.load(
    path,
    SpriteAnimationData.sequenced(
      amount: amount,
      stepTime: stepTime,
      textureSize: Vector2(width / amount, height),
    ),
  );

  /// Total height of the sprite sheet
  double get height;

  /// Path to the sprite sheet asset
  String get path;

  /// Duration of each frame in seconds
  double get stepTime => 0.1;

  /// Total width of the sprite sheet
  int get width;
}
