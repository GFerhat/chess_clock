class Time {
  final double time;
  final bool runTime;

  Time({required this.time, required this.runTime});

  Time copyWith({double? time, bool? runTime}) {
    return Time(time: time ?? this.time, runTime: runTime ?? this.runTime);
  }
}
