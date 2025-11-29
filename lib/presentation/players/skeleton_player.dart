import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/presentation/animations/animations.dart';

class SkeletonPlayer extends SimplePlayer
    with HandleForces, BlockMovementCollision {
  SkeletonPlayer({required super.position})
    : super(
        animation: Animations.skeleton,
        // Multiplied by 4 because sprite is super small
        size: Vector2.all(Globals.tileSize * 4),
        speed: 40,
      );

  @override
  Future<void> onLoad() async {
    add(
      RectangleHitbox(
        size: Vector2.all(Globals.tileSize),
        position: size / 2.5,
      ),
    );
    return super.onLoad();
  }
}
