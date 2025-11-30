import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/presentation/animations/animations.dart';

class BoyNpc extends SimpleNpc
    with HandleForces, BlockMovementCollision, RandomMovement, TapGesture {
  bool _observedPlayer = false;

  BoyNpc({required super.position, required super.speed})
    : super(animation: Animations.boy, size: Vector2.all(Globals.tileSize));

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox(size: Vector2.all(Globals.tileSize)));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    runRandomMovement(dt, speed: speed, maxDistance: 50, minDistance: 25);

    if (gameRef.player != null) {
      seeComponent(
        gameRef.player!,
        observed: (_) => _observedPlayer = true,
        notObserved: () => _observedPlayer = false,
      );
    }

    super.update(dt);
  }

  @override
  void onTap() {
    if (_observedPlayer) {
      // Show dialogue when tapped
      TalkDialog.show(context, [
        Say(text: [const TextSpan(text: 'Welcome to project hall!')]),
        Say(
          text: [
            const TextSpan(
              text: 'Look around and see what apps Trey has made before.',
            ),
          ],
        ),
      ]);
    }
  }
}
