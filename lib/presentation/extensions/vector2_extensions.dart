import 'package:bonfire/bonfire.dart';

/// Extension methods for Vector2 to create collision hitboxes.
extension Vector2Extensions on Vector2 {
  /// Creates a centered hitbox for actors (players, NPCs) with half the original size.
  RectangleHitbox actorToHitbox() => RectangleHitbox(
    size: Vector2.all(x / 2),
    position: Vector2(x / 4, y / 4),
    isSolid: true,
  );

  /// Creates a bottom-centered hitbox for objects (decorations, obstacles).
  RectangleHitbox objectToHitbox() => RectangleHitbox(
    size: Vector2.all(x / 2),
    position: Vector2.all(x / 3),
    isSolid: true,
  );
}
