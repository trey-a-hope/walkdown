import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/data/enums/map_json.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_cubit.dart';

class Entrance extends GameDecoration with Vision, TapGesture {
  final MapCubit mapCubit;
  final MapJson mapJson;

  bool _observedPlayer = false;

  Entrance({
    required super.position,
    required this.mapCubit,
    required this.mapJson,
  }) : super(size: Vector2.all(Globals.tileSize));

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
        radiusVision: Globals.tileSize,
      );
    }

    super.update(dt);
  }

  void _enter() {
    if (_observedPlayer) {
      logger.d('entering...');
      // Capture current player position before switching maps
      final playerPosition = gameRef.player?.position;
      mapCubit.updateMap(mapJson, playerPosition: playerPosition);
    } else {
      logger.d('you are not close enough to enter');
    }
  }

  @override
  void onTap() => _enter();
}
