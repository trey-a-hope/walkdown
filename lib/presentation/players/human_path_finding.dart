import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:walkdown/presentation/players/skeleton_player.dart';

class HumanPathFinding extends SkeletonPlayer with PathFinding, TapGesture {
  HumanPathFinding({required super.position}) {
    setupPathFinding(pathLineStrokeWidth: 2, pathLineColor: Colors.white);
  }

  @override
  void onTap() {}

  @override
  void onTapDownScreen(GestureEvent event) {
    moveToPositionWithPathFinding(event.worldPosition);
    super.onTapDownScreen(event);
  }
}
