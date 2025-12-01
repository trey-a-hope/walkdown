import 'package:bonfire/bonfire.dart';
import 'package:walkdown/presentation/animations/animations.dart';
import 'package:walkdown/presentation/animations/interfaces/i_sprite_sheet_reader.dart';

class VillagerRunUp extends ISpriteSheetReader {
  @override
  int get amount => 3;

  @override
  SpriteSheet get spriteSheet => LoadedSpriteSheets.villager;

  @override
  int get startCol => 1;

  @override
  int get startRow => 1;

  @override
  bool get vertical => true;
}
