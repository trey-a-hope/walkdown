import 'package:walkdown/presentation/games/interfaces/i_sprite_sheet.dart';

class BoySpriteSheet extends ISpriteSheet {
  @override
  String get path => 'players/boy_sprite_sheet.png';

  @override
  int get columns => 4;

  @override
  int get rows => 7;
}
