import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:walkdown/data/configuration/gap_sizes.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/animations/animations.dart';

class BoyNpc extends SimpleNpc
    with HandleForces, BlockMovementCollision, RandomMovement, TapGesture {
  bool _observedPlayer = false;

  BoyNpc({required super.position})
    : super(
        animation: Animations.boy,
        size: Vector2.all(Globals.tileSize),
        speed: 20,
      );

  @override
  Future<void> onLoad() async {
    add(RectangleHitbox(size: Vector2.all(Globals.tileSize)));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    runRandomMovement(dt, speed: speed, maxDistance: 100, minDistance: 50);

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
    final textTheme = ShadTheme.of(context).textTheme;

    if (_observedPlayer) {
      TalkDialog.show(
        context,
        [
          Say(
            padding: EdgeInsets.all(GapSizes.mediumGap.mainAxisExtent),
            personSayDirection: PersonSayDirection.RIGHT,
            person: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/images/players/boy_faceset.png',
                fit: BoxFit.cover,
              ),
            ),
            text: [
              TextSpan(text: 'Welcome to ', style: textTheme.h4),
              TextSpan(
                text: '\"Project Hall\"',
                style: textTheme.h4.copyWith(color: Colors.blue),
              ),
              TextSpan(
                text:
                    '; take a look around and see what apps Trey has made before.',
                style: textTheme.h4,
              ),
            ],
          ),
        ],
        onClose: () {
          logger.i('Dialogue with BoyNpc closed');
        },
        onFinish: () {
          logger.i('Dialogue with BoyNpc finished');
        },
      );
    }
  }
}
