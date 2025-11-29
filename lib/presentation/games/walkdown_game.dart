import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/data/enums/map_index.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_cubit.dart';
import 'package:walkdown/presentation/decorations/entrance.dart';
import 'package:walkdown/presentation/players/human_path_finding.dart';

class WalkdownGame extends StatelessWidget {
  const WalkdownGame({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapIndex>(
      builder: (context, mapIndex) {
        late Vector2 startPos;
        late Map<String, GameComponent Function(Vector2)> objectsBuilder;

        switch (mapIndex) {
          case MapIndex.world:
            startPos = Vector2(Globals.tileSize, Globals.tileSize * 6);
            objectsBuilder = {
              'Blue House Entrance': (properties) => Entrance(
                position: properties,
                mapCubit: context.read<MapCubit>(),
                mapIndex: MapIndex.house1,
              ),
            };
          case MapIndex.house1:
            startPos = Vector2(Globals.tileSize, Globals.tileSize * 2);
            objectsBuilder = {
              'Blue House Exit': (properties) => Entrance(
                position: properties,
                mapCubit: context.read<MapCubit>(),
                mapIndex: MapIndex.world,
              ),
            };
        }

        return BonfireWidget(
          key: UniqueKey(),
          debugMode: true,
          map: WorldMapBySpritefusion(
            WorldMapReader.fromAsset(mapIndex.jsonPath),
            objectsBuilder: objectsBuilder,
          ),
          onReady: _onReady,
          player: HumanPathFinding(position: startPos),
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
