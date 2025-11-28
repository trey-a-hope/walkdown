import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:walkdown/data/constants/globals.dart';
import 'package:walkdown/presentation/players/human_path_finding.dart';

class WalkdownGame extends StatelessWidget {
  const WalkdownGame({super.key});

  @override
  Widget build(BuildContext context) {
    final startPos = Vector2(Globals.tileSize * 3, Globals.tileSize * 3);

    return BonfireWidget(
      map: WorldMapBySpritefusion(WorldMapReader.fromAsset(Globals.mapName)),
      player: HumanPathFinding(position: startPos),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, Globals.tileSize, 20),
      ),
      backgroundColor: const Color(0xff20a0b4),
    );
  }
}
