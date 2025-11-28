import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:walkdown/animation_configs.dart';
// import 'package:example/shared/util/person_sprite_sheet.dart';

class HumanPlayer extends SimplePlayer with BlockMovementCollision {
  HumanPlayer({required super.position})
    : super(
        animation: AnimationConfigs.oldManAnimation(),
        size: Vector2.all(24),
        speed: 32,
      );

  @override
  Future<void> onLoad() async {
    /// Adds rectangle collision
    add(RectangleHitbox(size: size / 2, position: size / 4));
    return super.onLoad();
  }
}
