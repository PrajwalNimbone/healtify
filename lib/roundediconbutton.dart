import 'package:flutter/material.dart';
import 'dart:async';

class RoundedIconButton extends StatefulWidget {
  RoundedIconButton({required this.icon, required this.onPressed});
  final VoidCallback onPressed;
  final IconData icon;

  @override
  _RoundedIconButtonState createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer(VoidCallback callback) {
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      callback();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _startTimer(widget.onPressed);
      },
      onTapUp: (_) {
        _stopTimer();
      },
      onTapCancel: () {
        _stopTimer();
      },
      child: RawMaterialButton(
        onPressed: () {
          widget.onPressed();
        },
        elevation: 5,
        child: Icon(widget.icon),
        constraints: BoxConstraints.tightFor(
          width: 58,
          height: 58,
        ),
        shape: CircleBorder(),
        fillColor: Colors.grey,
      ),
    );
  }
}
