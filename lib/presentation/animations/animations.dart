import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:walkdown/presentation/animations/boy/boy.dart';
import 'package:walkdown/presentation/animations/computer/computer.dart';
import 'package:walkdown/presentation/animations/villager/villager.dart';
import 'package:walkdown/presentation/animations/skeleton/skeleton.dart';
import 'package:walkdown/presentation/sprite_sheets/computer_sprite_sheet.dart';
import 'package:walkdown/presentation/sprite_sheets/sprite_sheets.dart';

/// Centralized animations manager for all game entities.
/// Provides animation configurations and handles sprite sheet preloading.
class Animations {
  // Private constructor to prevent instantiation
  Animations._();

  /// Preloads all sprite sheets in parallel for optimal performance.
  /// Must be called during app initialization before animations are used.
  static Future<void> preloadSpriteSheets() async {
    // Load all sprite sheets concurrently and assign to LoadedSpriteSheets
    await Future.wait([
      BoySpriteSheet().load().then((sheet) => LoadedSpriteSheets.boy = sheet),
      VillagerSpriteSheet().load().then(
        (sheet) => LoadedSpriteSheets.villager = sheet,
      ),
      ComputerSpriteSheet().load().then(
        (sprites) => LoadedSpriteSheets.computer = sprites,
      ),
    ]);
  }

  /// Skeleton character animations (8-directional movement)
  /// TODO (Trey) - Return SpriteAnimation not Future<SpriteAnimation>
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

  /// Boy character animations (8-directional movement)
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

  /// Villager character animations (8-directional movement)
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

  /// Computer decoration idle animation
  static SpriteAnimation get computerOn => ComputerOn().animation;
  static SpriteAnimation get computerOff => ComputerOff().animation;
}

/// Global container for preloaded sprite sheets.
/// Populated by Animations.preloadSpriteSheets() during initialization.
class LoadedSpriteSheets {
  /// Boy character sprite sheet
  static late SpriteSheet boy;

  /// Villager character sprite sheet
  static late SpriteSheet villager;

  /// Computer decoration sprites (list of individual frames)
  static late List<Sprite> computer;
}
