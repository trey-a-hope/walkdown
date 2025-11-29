import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/animations/animations.dart';

class SkeletonPlayer extends SimplePlayer
    with HandleForces, BlockMovementCollision {
  SkeletonPlayer({required super.position})
    : super(
        animation: Animations.skeleton,
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

  @override
  void onCollision(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    logger.d(other.toString());
    // Item? item;

    // switch (other) {
    //   case Chest():
    //     _recentChest = other;
    //     break;
    //   case PotionDecoration():
    //     item = Potion();
    //     break;
    //   case GemDecoration():
    //     item = Gem();
    //     break;
    //   case CoinDecoration():
    //     item = Coin();
    //     break;
    // }

    // if (item != null) {
    //   _receiveItem(item);
    // }

    super.onCollision(intersectionPoints, other);
  }
}
