import 'package:bonfire/bonfire.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkdown/data/enums/map_json.dart';
import 'package:walkdown/presentation/cubits/map/cubit/map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState(mapJson: MapJson.start));

  void updateMap(MapJson mapJson, {Vector2? playerPosition}) {
    emit(state.copyWith(mapJson: mapJson, playerPosition: playerPosition));
  }
}
