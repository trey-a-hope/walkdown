import 'package:bonfire/bonfire.dart';

abstract class ISpriteIteration {
  String get path;

  int get amount;

  double get stepTime => 0.3;

  Future<SpriteAnimation> get animation async {
    final sprites = <Sprite>[];

    for (int i = 1; i < 1 + amount; i++) {
      final sprite = await Sprite.load('$path$i.png');
      sprites.add(sprite);
    }

    return SpriteAnimation.spriteList(sprites, stepTime: stepTime);
  }
}
