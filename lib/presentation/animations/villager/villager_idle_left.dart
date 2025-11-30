import 'package:bonfire/bonfire.dart';
import 'package:walkdown/presentation/animations/animations.dart';
import 'package:walkdown/presentation/animations/interfaces/i_sprite_sheet_reader.dart';

class VillagerIdleLeft extends ISpriteSheetReader {
  @override
  int get amount => 1;

  @override
  SpriteSheet get spriteSheet => LoadedSpriteSheets.villager;
  @override
  int get startCol => 2;

  @override
  int get startRow => 0;

  @override
  bool get vertical => true;
}
