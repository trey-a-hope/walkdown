import 'package:bonfire/bonfire.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/animations/interfaces/i_sprite_sheet_reader.dart';

class BoyRunRight extends ISpriteSheetReader {
  @override
  int get amount => 3;

  @override
  SpriteSheet get spriteSheet => LoadedSpriteSheets.boy;

  @override
  int get startCol => 3;

  @override
  int get startRow => 1;

  @override
  bool get vertical => true;
}
