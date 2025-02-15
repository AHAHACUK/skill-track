import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocListenableTransformer<T> on BlocBase<T> {
  ValueListenable<T> toValueListenable() =>
      _BlocListenableTransformer(stream: this);
}

class _BlocListenableTransformer<T> implements ValueListenable<T> {
  final BlocBase<T> _bloc;
  final Map<VoidCallback, StreamSubscription<T>> _listenerMap = {};

  _BlocListenableTransformer({
    required BlocBase<T> stream,
  }) : _bloc = stream;

  @override
  void addListener(VoidCallback listener) {
    final sub = _bloc.stream.listen((_) => listener());
    _listenerMap[listener] = sub;
  }

  @override
  void removeListener(VoidCallback listener) {
    final sub = _listenerMap[listener];
    sub?.cancel();
    _listenerMap.remove(listener);
  }

  @override
  T get value => _bloc.state;
}
