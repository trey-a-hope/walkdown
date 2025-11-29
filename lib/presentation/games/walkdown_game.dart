import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/main.dart';
import 'package:walkdown/presentation/house.dart';
import 'package:walkdown/presentation/players/human_path_finding.dart';

class WalkdownGame extends StatelessWidget {
  const WalkdownGame({super.key});

  @override
  Widget build(BuildContext context) {
    final startPos = Vector2(Globals.tileSize, Globals.tileSize * 6);

    return BonfireWidget(
      debugMode: true,
      map: WorldMapBySpritefusion(
        WorldMapReader.fromAsset(Globals.mapName),
        objectsBuilder: {
          'House Entrance': (properties) => House(
            position: properties,
          ),
        },
      ),
      overlayBuilderMap: {
        'myWidget': (context, game) => Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: Padding(
            padding: const EdgeInsetsGeometry.only(bottom: 16),
            child: ElevatedButton(
              onPressed: () {
                logger.d('Entering house...');
              },
              child: const Text('Enter House'),
            ),
          ),
        ),
      },
      initialActiveOverlays: const ['myWidget'],

      player: HumanPathFinding(position: startPos),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, Globals.tileSize, 20),
      ),
      backgroundColor: const Color(0xff20a0b4),
    );
  }
}
