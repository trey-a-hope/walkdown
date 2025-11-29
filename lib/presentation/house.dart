import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/extensions/vector2_extensions.dart';

class House extends GameDecoration with Vision {
  bool _observedPlayer = false;

  House({required super.position})
    : super(
        size: Vector2(
          Globals.tileSize,
          Globals.tileSize,
        ),
      );

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2.all(Globals.tileSize * 2),
        position: size,
      ),
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (gameRef.player != null) {
      seeComponent(
        gameRef.player!,
        observed: (player) => _observedPlayer = true,
        notObserved: () => _observedPlayer = false,
        radiusVision: Globals.tileSize,
      );
    }

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (_observedPlayer) {
      logger.d('House observed player');
      // showAnimationStroke(
      //   Colors.white,
      //   2,
      //   offset: Vector2(1, -1),
      // );
    } else {
      hideAnimationStroke();
    }
    super.render(canvas);
  }
}
