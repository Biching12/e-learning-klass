import 'dart:async';

import 'package:e_learning_klass/common/values/colors.dart';
import 'package:flutter/material.dart';

class ExamTime extends StatefulWidget {
  final int initialTimeInSeconds;
  final VoidCallback? onTimeUp;
  final bool changeColor;
  const ExamTime({
    super.key,
    required this.initialTimeInSeconds,
    this.onTimeUp,
    this.changeColor = true,
  });

  @override
  State<ExamTime> createState() => _ExamTimeState();
}

class _ExamTimeState extends State<ExamTime> {
  late int _remainingSeconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialTimeInSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
        widget.onTimeUp?.call();
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.timer,
            color: widget.changeColor
                ? AppColors.primaryBackground
                : AppColors.primaryThirdBackground),
        const SizedBox(width: 5),
        Text(
          _formatTime(_remainingSeconds),
          style: TextStyle(
              color: widget.changeColor
                  ? AppColors.primaryBackground
                  : AppColors.primaryThirdBackground),
        ),
      ],
    );
  }
}
