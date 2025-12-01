import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/presentation/animations/animations.dart';
import 'package:walkdown/presentation/extensions/vector2_extensions.dart';

class VillagerPlayer extends SimplePlayer
    with HandleForces, BlockMovementCollision {
  VillagerPlayer({required super.position})
    : super(
        animation: Animations.villager,
        size: Vector2.all(Globals.tileSize),
        speed: 40,
      );

  @override
  Future<void> onLoad() async {
    add(Vector2.all(Globals.tileSize).actorToHitbox());
    return super.onLoad();
  }
}
