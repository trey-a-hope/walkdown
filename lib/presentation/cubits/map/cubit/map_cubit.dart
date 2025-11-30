import 'package:bonfire/bonfire.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkdown/data/enums/map_index.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState(mapIndex: MapIndex.world));

  void updateMap(MapIndex mapIndex, {Vector2? playerPosition}) {
    emit(state.copyWith(
      mapIndex: mapIndex,
      playerPosition: playerPosition,
    ));
  }
}
