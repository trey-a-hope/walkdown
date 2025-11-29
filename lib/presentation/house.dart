import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/main.dart';

class House extends GameDecoration with Vision, TapGesture {
  bool _observedPlayer = false;

  House({required super.position})
    : super(size: Vector2(Globals.tileSize, Globals.tileSize));

  @override
  Future<void> onLoad() {
    // Collider property in Sprite Fusion is overriden if object is mapped out
    // in the objectsBuilder
    add(RectangleHitbox(size: size));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (gameRef.player != null) {
      seeComponent(
        gameRef.player!,
        observed: (_) => _observedPlayer = true,
        notObserved: () => _observedPlayer = false,
      );
    }

    super.update(dt);
  }

  void enterHouse() {
    if (_observedPlayer) {
      logger.d('lets enter the house baby!');
    } else {
      logger.d('you are not close enough to enter the house');
    }
  }

  @override
  void onTap() => enterHouse();
}
