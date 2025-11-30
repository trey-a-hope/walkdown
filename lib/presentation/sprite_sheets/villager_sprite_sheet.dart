import 'package:walkdown/presentation/games/interfaces/i_sprite_sheet.dart';

class VillagerSpriteSheet extends ISpriteSheet {
  @override
  String get path => 'players/villager_sprite_sheet.png';

  @override
  int get columns => 4;

  @override
  int get rows => 7;
}
