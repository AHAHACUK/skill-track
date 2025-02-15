import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skill_track_client/toolkit/utils/context_util.dart';

/// Covers child with semi-transparent 'veil' with loading indicator
/// when controller sets to *true*.
///
/// Ignores *true* value for [delay] before building 'veil'
/// in case value will change immediately after
class LoadingVeilWrapper extends StatefulWidget {
  final ValueListenable<bool> controller;
  final Duration? delay;
  final Widget child;

  const LoadingVeilWrapper({
    required this.controller,
    this.delay,
    required this.child,
    super.key,
  });

  @override
  State<LoadingVeilWrapper> createState() => _LoadingVeilWrapperState();
}

class _LoadingVeilWrapperState extends State<LoadingVeilWrapper> {
  late final ValueNotifier<bool> _innerController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _innerController = ValueNotifier(false);
    widget.controller.addListener(_outerControllerListener);
    _outerControllerListener();
  }

  @override
  void didUpdateWidget(covariant LoadingVeilWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_outerControllerListener);
      widget.controller.addListener(_outerControllerListener);
      _outerControllerListener();
    }
  }

  void _outerControllerListener() {
    final innerValue = _innerController.value;
    final outerValue = widget.controller.value;
    if (outerValue == innerValue) {
      _timer?.cancel();
      _timer = null;
    }
    if (outerValue == true) {
      if (_timer != null) return;
      if (widget.delay == null) {
        _innerController.value = true;
      } else {
        _timer = Timer(widget.delay!, () {
          _timer = null;
          _innerController.value = true;
        });
      }
      return;
    }
    if (outerValue == false) {
      _innerController.value = false;
      return;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.controller.removeListener(_outerControllerListener);
    _innerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    return Stack(
      children: [
        widget.child,
        AnimatedBuilder(
          animation: _innerController,
          builder: (_, __) {
            if (!_innerController.value) {
              return const SizedBox.shrink();
            }
            return DecoratedBox(
              decoration: BoxDecoration(
                color: colors.onSurface.withOpacity(0.25),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: colors.primary,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
