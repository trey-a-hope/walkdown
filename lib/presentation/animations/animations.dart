import 'package:bonfire/bonfire.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/animations/boy/boy.dart';
import 'package:walkdown/presentation/animations/skeleton/skeleton.dart';
import 'package:walkdown/presentation/sprite_sheets/sprite_sheets.dart';

class Animations {
  Animations._();

  static Future<void> preloadSpriteSheets() async {
    final boy = BoySpriteSheet().load();

    final sheetsAsync = [boy];

    final res = await Future.wait<SpriteSheet>(sheetsAsync);

    LoadedSpriteSheets.boy = res[0];

    return;
  }

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

  static SimpleDirectionAnimation get boy => SimpleDirectionAnimation(
    idleDown: BoyIdleDown().animation,
    runDown: BoyRunDown().animation,
    idleUp: BoyIdleUp().animation,
    runUp: BoyRunUp().animation,
    idleLeft: BoyIdleLeft().animation,
    runLeft: BoyRunLeft().animation,
    idleRight: BoyIdleRight().animation,
    runRight: BoyRunRight().animation,
  );
}
