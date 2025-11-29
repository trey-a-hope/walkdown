import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walkdown/data/enums/map_index.dart';

class MapCubit extends Cubit<MapIndex> {
  MapCubit() : super(MapIndex.world);

  void updateMap(MapIndex mapIndex) => emit(mapIndex);
}
