import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/data/enums/map_json.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_cubit.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_state.dart';
import 'package:walkdown/presentation/decorations/entrance.dart';
import 'package:walkdown/presentation/players/human_path_finding.dart';

class WalkdownGame extends StatelessWidget {
  const WalkdownGame({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, mapState) {
        late Vector2 defaultStartPos;
        late Map<String, GameComponent Function(Vector2)> objectsBuilder;

        switch (mapState.mapJson) {
          case MapJson.world:
            defaultStartPos = Vector2(Globals.tileSize, Globals.tileSize * 6);
            objectsBuilder = {
              'Blue House Entrance': (properties) => Entrance(
                position: properties,
                mapCubit: context.read<MapCubit>(),
                mapJson: MapJson.house1,
              ),
            };
          case MapJson.house1:
            defaultStartPos = Vector2(Globals.tileSize, Globals.tileSize * 2);
            objectsBuilder = {
              'Blue House Exit': (properties) => Entrance(
                position: properties,
                mapCubit: context.read<MapCubit>(),
                mapJson: MapJson.world,
              ),
            };
        }

        // Use stored position if available, otherwise use default
        final playerStartPos = mapState.playerPosition ?? defaultStartPos;

        return BonfireWidget(
          key: UniqueKey(),
          debugMode: const String.fromEnvironment('MODE') == 'DEBUG',
          map: WorldMapBySpritefusion(
            WorldMapReader.fromAsset(mapState.mapJson.path),
            objectsBuilder: objectsBuilder,
          ),
          onReady: _onReady,
          player: HumanPathFinding(position: playerStartPos),
          cameraConfig: CameraConfig(
            zoom: getZoomFromMaxVisibleTile(context, Globals.tileSize, 20),
          ),
          backgroundColor: const Color(0xff20a0b4),
        );
      },
    );
  }

  void _onReady(BonfireGameInterface bonfireGameInterface) {
    logger.d('"Walkdown" is now ready. 👍🏾');
  }
}
