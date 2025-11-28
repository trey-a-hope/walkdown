import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/presentation/animations/animations.dart';

class SkeletonPlayer extends SimplePlayer with BlockMovementCollision {
  SkeletonPlayer({required super.position})
    : super(
        animation: Animations.skeleton,
        size: Vector2.all(Globals.tileSize * 4),
        speed: 40,
      );

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox(size: size / 2, position: size / 4));
    return super.onLoad();
  }
}
