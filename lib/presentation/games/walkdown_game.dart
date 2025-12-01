import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/data/enums/map_json.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/components/decorations/computer_decoration.dart';
import 'package:walkdown/presentation/components/decorations/entrance.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_cubit.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_state.dart';
import 'package:walkdown/presentation/components/players/player_path_finder.dart';
import 'package:walkdown/presentation/components/npcs/boy_npc.dart';
import 'package:walkdown/presentation/extensions/double_tuple_int_extensions.dart';

class WalkdownGame extends StatelessWidget {
  const WalkdownGame({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, mapState) {
        final Vector2 defaultStartPos = (3, 6).plot;
        final Map<String, GameComponent Function(Vector2)> objectsBuilder = {};
        final List<GameComponent> components = [];

        final house1Entrance = Entrance(
          position: (6, 7).plot,
          mapCubit: context.read<MapCubit>(),
          mapJson: MapJson.house1,
        );

        final house1Exit = Entrance(
          position: (4, 7).plot,
          mapCubit: context.read<MapCubit>(),
          mapJson: MapJson.world,
        );

        switch (mapState.mapJson) {
          // World
          case MapJson.world:
            components.addAll([house1Entrance]);
            objectsBuilder.addAll({});
          // House 1
          case MapJson.house1:
            components.addAll([
              BoyNpc(position: (3, 3).plot),
              house1Exit,
              ComputerDecoration(
                url: 'https://giftgrab.codemagic.app/',
                position: (1, 4).plot,
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
            zoom: getZoomFromMaxVisibleTile(context, Globals.tileSize, 25),
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
