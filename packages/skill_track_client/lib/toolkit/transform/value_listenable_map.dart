import 'package:flutter/foundation.dart';

typedef ValueTransformer<T, R> = R Function(T value);

extension ValueListenableMap<T> on ValueListenable<T> {
  ValueListenable<R> map<R>(ValueTransformer<T, R> transformer) =>
      _ValueListenableMapper<T, R>(this, transformer);
}

class _ValueListenableMapper<T, R> implements ValueListenable<R> {
  final ValueListenable<T> _source;
  final ValueTransformer<T, R> _transformer;

  _ValueListenableMapper(this._source, this._transformer);

  @override
  void addListener(VoidCallback listener) {
    _source.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _source.removeListener(listener);
  }

  @override
  R get value => _transformer(_source.value);
}
