import 'package:bonfire/bonfire.dart';
import 'package:equatable/equatable.dart';
import 'package:walkdown/data/enums/map_json.dart';

class MapState extends Equatable {
  final MapJson mapJson;
  final Vector2? playerPosition;

  const MapState({required this.mapJson, this.playerPosition});

  MapState copyWith({MapJson? mapJson, Vector2? playerPosition}) {
    return MapState(
      mapJson: mapJson ?? this.mapJson,
      playerPosition: playerPosition ?? this.playerPosition,
    );
  }

  @override
  List<Object?> get props => [mapJson, playerPosition];
}
