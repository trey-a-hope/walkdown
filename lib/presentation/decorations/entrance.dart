import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/data/enums/map_index.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_cubit.dart';

class Entrance extends GameDecoration with Vision, TapGesture {
  final MapCubit mapCubit;
  final MapIndex mapIndex;

  bool _observedPlayer = false;

  Entrance({
    required super.position,
    required this.mapCubit,
    required this.mapIndex,
  }) : super(
         size: Vector2(
           Globals.tileSize,
           Globals.tileSize,
         ),
       );

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

  void enter() {
    if (_observedPlayer) {
      logger.d('entering...');
      mapCubit.updateMap(mapIndex);
    } else {
      logger.d('you are not close enough to enter');
    }
  }

  @override
  void onTap() => enter();
}
