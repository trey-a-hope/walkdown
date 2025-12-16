import 'package:bonfire/bonfire.dart';
import 'package:walkdown/data/constants/globals.dart';

/// Type alias for grid coordinates as (x, y) tuple.
typedef Grid = (int, int);

/// Extension methods for Grid coordinates.
extension GridExtensions on Grid {
  /// Converts grid coordinates to world position by multiplying by tile size.
  Vector2 get plot => Vector2(Globals.tileSize * $1, Globals.tileSize * $2);
}
