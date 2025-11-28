import 'package:walkdown/presentation/animations/interfaces/i_sprite_builder.dart';

class SkeletonWalk extends ISpriteBuilder {
  @override
  int get amount => 8;

  @override
  double get height => 64.0;

  @override
  String get path => 'players/skeleton_walk_strip8.png';

  @override
  int get width => 768;
}
