enum MapIndex {
  world(jsonPath: 'map_world/map.json'),
  house1(jsonPath: 'map_house_1/map.json'),
  ;

  const MapIndex({
    required this.jsonPath,
  });

  final String jsonPath;
}
