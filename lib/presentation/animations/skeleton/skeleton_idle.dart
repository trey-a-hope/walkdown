import 'package:walkdown/presentation/animations/interfaces/i_sprite_builder.dart';

class SkeletonIdle extends ISpriteBuilder {
  @override
  int get amount => 6;

  @override
  double get height => 64.0;

  @override
  String get path => 'players/skeleton_idle_strip6.png';

  @override
  int get width => 576;
}
