import 'package:flame/src/sprite.dart';
import 'package:walkdown/presentation/animations/animations.dart';
import 'package:walkdown/presentation/animations/interfaces/i_sprite_iteration.dart';

class ComputerOn extends ISpriteIteration {
  @override
  List<Sprite> get sprites => LoadedSpriteSheets.computer.sublist(1);
}
