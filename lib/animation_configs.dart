import 'package:bonfire/bonfire.dart';

class AnimationConfigs {
  AnimationConfigs._();

  static Future<SpriteAnimation> skeleton() => SpriteAnimation.load(
    'players/skeleton_idle_strip6.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.3,
      textureSize: Vector2(10, 10),
    ),
  );

  static SimpleDirectionAnimation oldManAnimation() => SimpleDirectionAnimation(
    idleDown: skeleton(),
    runDown: skeleton(),
    idleUp: skeleton(),
    runUp: skeleton(),
    idleLeft: skeleton(),
    runLeft: skeleton(),
    idleRight: skeleton(),
    runRight: skeleton(),
  );
}
