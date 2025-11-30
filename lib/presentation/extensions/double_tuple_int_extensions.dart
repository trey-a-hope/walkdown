import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';

extension DoubleTupleIntExtensions on (int, int) {
  Vector2 get plot => Vector2(Globals.tileSize * $1, Globals.tileSize * $2);
}
