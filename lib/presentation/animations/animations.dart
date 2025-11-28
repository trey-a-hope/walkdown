import 'package:bonfire/bonfire.dart';
import 'package:walkdown/presentation/animations/skeleton/skeleton.dart';

class Animations {
  Animations._();

  static SimpleDirectionAnimation get skeleton => SimpleDirectionAnimation(
    idleDown: SkeletonIdle().animation,
    runDown: SkeletonWalk().animation,
    idleUp: SkeletonIdle().animation,
    runUp: SkeletonWalk().animation,
    idleLeft: SkeletonIdle().animation,
    runLeft: SkeletonWalk().animation,
    idleRight: SkeletonIdle().animation,
    runRight: SkeletonWalk().animation,
  );
}
