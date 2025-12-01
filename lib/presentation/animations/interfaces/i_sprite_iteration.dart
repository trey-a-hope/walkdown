import 'package:bonfire/bonfire.dart';

abstract class ISpriteIteration {
  double get stepTime => 0.3;

  List<Sprite> get sprites;

  SpriteAnimation get animation =>
      SpriteAnimation.spriteList(sprites, stepTime: stepTime);
}
