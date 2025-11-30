enum MapJson {
  world(path: 'map_world/map.json'),
  house1(path: 'house_1/map.json');

  const MapJson({required this.path});

  final String path;
}
