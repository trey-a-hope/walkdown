import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/data/enums/map_json.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/components/decorations/entrance.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_cubit.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_state.dart';
import 'package:walkdown/presentation/components/players/player_path_finder.dart';
import 'package:walkdown/presentation/components/npcs/boy_npc.dart';

class WalkdownGame extends StatelessWidget {
  const WalkdownGame({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, mapState) {
        late Vector2 defaultStartPos;
        final Map<String, GameComponent Function(Vector2)> objectsBuilder = {};
        final List<GameComponent> components = [];

        switch (mapState.mapJson) {
          case MapJson.world:
            defaultStartPos = Vector2(Globals.tileSize, Globals.tileSize * 6);
            components.addAll([
              Entrance(
                position: Vector2(Globals.tileSize * 4, Globals.tileSize * 5),
                mapCubit: context.read<MapCubit>(),
                mapJson: MapJson.house1,
              ),
            ]);
            objectsBuilder.addAll({});
          case MapJson.house1:
            defaultStartPos = Vector2(Globals.tileSize, Globals.tileSize * 2);
            components.addAll([
              BoyNpc(
                position: Vector2(Globals.tileSize * 3, Globals.tileSize * 3),
              ),
              Entrance(
                position: Vector2(Globals.tileSize * 4, Globals.tileSize * 7),
                mapCubit: context.read<MapCubit>(),
                mapJson: MapJson.world,
              ),
            ]);
            objectsBuilder.addAll({});
        }

        // Use stored position if available, otherwise use default
        final playerStartPos = mapState.playerPosition ?? defaultStartPos;

        return BonfireWidget(
          key: UniqueKey(),
          debugMode: const String.fromEnvironment('MODE') == 'DEBUG',
          // collisionAreaColor: Colors.red,
          // showCollisionArea: true,
          components: components,
          map: WorldMapBySpritefusion(
            WorldMapReader.fromAsset(mapState.mapJson.path),
            objectsBuilder: objectsBuilder,
          ),
          onReady: _onReady,
          player: PlayerPathFinder(position: playerStartPos),
          cameraConfig: CameraConfig(
            zoom: getZoomFromMaxVisibleTile(context, Globals.tileSize, 20),
          ),
          backgroundColor: Colors.black,
        );
      },
    );
  }

  void _onReady(BonfireGameInterface bonfireGameInterface) {
    logger.d('"Walkdown" is now ready. 👍🏾');
  }
}
