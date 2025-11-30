import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/presentation/animations/animations.dart';

class BoyNpc extends SimpleNpc with HandleForces, BlockMovementCollision {
  BoyNpc({required super.position})
    : super(
        animation: Animations.boy,
        size: Vector2.all(Globals.tileSize),
        speed: 40,
      );

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox(size: Vector2.all(Globals.tileSize)));
    return super.onLoad();
  }
}
