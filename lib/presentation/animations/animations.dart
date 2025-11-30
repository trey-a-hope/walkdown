import 'package:bonfire/bonfire.dart';
import 'package:walkdown/presentation/animations/boy/boy.dart';
import 'package:walkdown/presentation/animations/villager/villager.dart';
import 'package:walkdown/presentation/animations/skeleton/skeleton.dart';
import 'package:walkdown/presentation/sprite_sheets/sprite_sheets.dart';

class Animations {
  Animations._();

  static Future<void> preloadSpriteSheets() async {
    final boy = BoySpriteSheet().load();
    final villager = VillagerSpriteSheet().load();

    final sheetsAsync = [boy, villager];

    final res = await Future.wait<SpriteSheet>(sheetsAsync);

    LoadedSpriteSheets.boy = res[0];
    LoadedSpriteSheets.villager = res[1];

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

  static SimpleDirectionAnimation get villager => SimpleDirectionAnimation(
    idleDown: VillagerIdleDown().animation,
    runDown: VillagerRunDown().animation,
    idleUp: VillagerIdleUp().animation,
    runUp: VillagerRunUp().animation,
    idleLeft: VillagerIdleLeft().animation,
    runLeft: VillagerRunLeft().animation,
    idleRight: VillagerIdleRight().animation,
    runRight: VillagerRunRight().animation,
  );
}

class LoadedSpriteSheets {
  static late SpriteSheet boy;
  static late SpriteSheet villager;
}
