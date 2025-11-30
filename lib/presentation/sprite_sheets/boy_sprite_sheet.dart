import 'package:bonfire/bonfire.dart';

abstract class ISpriteSheet {
  Future<SpriteSheet> load();
}

class BoySpriteSheet implements ISpriteSheet {
  @override
  Future<SpriteSheet> load() async {
    final image = await Flame.images.load('players/boy_sprite_sheet.png');
    return SpriteSheet.fromColumnsAndRows(image: image, columns: 4, rows: 7);
  }
}
