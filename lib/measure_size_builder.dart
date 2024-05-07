import 'dart:async';

import 'package:flutter/material.dart';

class MeasureSizeBuilder extends StatefulWidget {
  /// The builder function that takes a BuildContext and a Size and returns a Widget.
  final Widget Function(BuildContext context, Size size) builder;

  /// When the size of the widget wrapped by the [builder] changes, [MeasureSizeBuilder] rebuilds.
  /// Setting a smaller duration for [sensitivity] results in a shorter rebuild cycle.
  /// However, frequent rebuilds can impact performance, so it's recommended to use this feature sparingly.
  /// The default value is 'Duration(milliseconds: 100)'.
  final Duration? sensitivity;

  const MeasureSizeBuilder(
      {super.key, required this.builder, this.sensitivity});

  @override
  State<MeasureSizeBuilder> createState() => _MeasureSizeBuilderState();
}

class _MeasureSizeBuilderState extends State<MeasureSizeBuilder> {
  /// Variable to hold the size of the widget
  /// The initial size is Size(0,0). It gets updated to an appropriate size when the widget inside the builder takes up space.
  Size _size = Size.zero;

  /// Debouncer to delay processing size changes.
  late _Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    // Set Debouncer duration
    _debouncer = _Debouncer(
      widget.sensitivity ?? const Duration(milliseconds: 50),
    );

    // Add a callback to get the size of the widget after rendering.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setSize(context.size ?? Size.zero);
    });
  }

  /// Method to set the size of the widget.
  void _setSize(Size newSize) {
    if (_size != newSize) {
      setState(() {
        _size = newSize;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Return a NotificationListener to listen for size changes.
    return NotificationListener(
      onNotification: (notification) {
        _debouncer.run(() {
          _setSize(context.size!);
        });
        return true;
      },
      child: widget.builder(context, _size),
    );
  }
}

/// Class for debouncing function calls.
class _Debouncer {
  final Duration delay;
  Timer? _timer;

  _Debouncer(this.delay);

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}
