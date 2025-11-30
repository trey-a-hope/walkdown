import 'package:bonfire/bonfire.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/animations/interfaces/i_sprite_sheet_reader.dart';

class BoyIdleDown extends ISpriteSheetReader {
  @override
  int get amount => 1;

  @override
  SpriteSheet get spriteSheet => LoadedSpriteSheets.boy;

  @override
  int get startCol => 0;

  @override
  int get startRow => 0;

  @override
  bool get vertical => true;
}
