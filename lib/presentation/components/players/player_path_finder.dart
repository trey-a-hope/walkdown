import 'package:bonfire/bonfire.dart';
import 'package:walkdown/presentation/components/players/villager_player.dart';

class PlayerPathFinder extends VillagerPlayer with PathFinding, TapGesture {
  PlayerPathFinder({required super.position}) {
    setupPathFinding(
      linePathEnabled: const String.fromEnvironment('MODE') == 'DEBUG',
    );
  }

  @override
  void onTap() {}

  @override
  void onTapDownScreen(GestureEvent event) {
    moveToPositionWithPathFinding(event.worldPosition);
    super.onTapDownScreen(event);
  }
}
