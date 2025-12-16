/// Extension methods for nullable booleans.
extension NullableBoolExtensions on bool? {
  /// Returns false if the value is null, otherwise returns the actual value.
  bool falseIfNull() => this == true ? true : false;
}
