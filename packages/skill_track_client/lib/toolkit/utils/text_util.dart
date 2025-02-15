extension TextUtil on String {
  static final _buffer = StringBuffer();

  /// Capitalize first letter of string
  ///
  /// hello world => Hello world
  String get capitalized {
    final firstLetterUpperCase = this[0].toUpperCase();
    final otherLetters = substring(1);
    return '$firstLetterUpperCase$otherLetters';
  }

  bool get isSpace {
    assert(length == 1);
    return RegExp(r'[ \n\t]').hasMatch(this);
  }

  /// Capitalize first letter of every word
  ///
  /// hello world => Hello World
  String get capitalizedWords {
    var capitalizeNext = true;
    for (var i = 0; i < length; i++) {
      final char = this[i];
      if (char.isSpace) {
        capitalizeNext = true;
        _buffer.write(char);
        continue;
      }
      if (capitalizeNext) {
        _buffer.write(char.toUpperCase());
        capitalizeNext = false;
        continue;
      }
      _buffer.write(char);
      continue;
    }
    final result = _buffer.toString();
    _buffer.clear();
    return result;
  }
}
