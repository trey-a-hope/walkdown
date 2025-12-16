import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/data/enums/map_json.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_cubit.dart';
import 'package:walkdown/presentation/extensions/grid_extensions.dart';

class Entrance extends GameDecoration with Vision, TapGesture {
  final MapCubit mapCubit;
  final MapJson from;
  final MapJson to;

  bool _observedPlayer = false;

  Entrance({
    required super.position,
    required this.mapCubit,
    required this.from,
    required this.to,
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
      mapCubit.updateMap(to, playerPosition: _determineStartingPosition());
    } else {
      logger.d('you are not close enough to enter');
    }
  }

  // TODO (Trey) - Make dynamic to handle different enter/exit combinations.
  Vector2 _determineStartingPosition() {
    switch (to) {
      case MapJson.world:
        if (from == MapJson.house1) return (6, 8).plot;
        if (from == MapJson.house2) return (16, 10).plot;
        return (0, 0).plot;
      case MapJson.house1:
        return (4, 6).plot;
      case MapJson.house2:
        return (6, 7).plot;
    }
  }

  @override
  void onTap() => _enter();
}
