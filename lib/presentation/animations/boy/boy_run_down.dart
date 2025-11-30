import 'package:bonfire/bonfire.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/animations/interfaces/i_sprite_sheet_reader.dart';

class BoyRunDown extends ISpriteSheetReader {
  @override
  int get amount => 3;

  @override
  SpriteSheet get spriteSheet => LoadedSpriteSheets.boy;

  @override
  int get startCol => 0;

  @override
  int get startRow => 1;

  @override
  bool get vertical => true;
}
