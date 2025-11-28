import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:walkdown/human_path_finding.dart';

class PathFindingPage extends StatelessWidget {
  static const _mapName = 'map/map.json';

  const PathFindingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    return BonfireWidget(
      map: WorldMapBySpritefusion(WorldMapReader.fromAsset(_mapName)),
      player: HumanPathFinding(position: Vector2(tileSize * 3, tileSize * 3)),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
      ),
      backgroundColor: const Color(0xff20a0b4),
    );
  }
}
