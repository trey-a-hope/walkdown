import 'package:bonfire/bonfire.dart';
import 'package:equatable/equatable.dart';
import 'package:walkdown/data/enums/map_index.dart';

class MapState extends Equatable {
  final MapIndex mapIndex;
  final Vector2? playerPosition;

  const MapState({
    required this.mapIndex,
    this.playerPosition,
  });

  MapState copyWith({
    MapIndex? mapIndex,
    Vector2? playerPosition,
  }) {
    return MapState(
      mapIndex: mapIndex ?? this.mapIndex,
      playerPosition: playerPosition ?? this.playerPosition,
    );
  }

  @override
  List<Object?> get props => [mapIndex, playerPosition];
}
