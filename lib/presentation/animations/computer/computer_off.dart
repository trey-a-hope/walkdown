import 'package:flame/src/sprite.dart';
import 'package:walkdown/presentation/animations/animations.dart';
import 'package:walkdown/presentation/animations/interfaces/i_sprite_iteration.dart';

class ComputerOff extends ISpriteIteration {
  @override
  List<Sprite> get sprites => [LoadedSpriteSheets.computer.first];
}
