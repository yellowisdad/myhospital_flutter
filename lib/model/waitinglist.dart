import 'dart:ffi';

class WaitingList {
  final Int patientCount;
  final Int levelOfPain;
  final Int averageProcessTime;

  WaitingList(
      {required this.patientCount,
      required this.levelOfPain,
      required this.averageProcessTime});

  factory WaitingList.fromJson(Map<String, dynamic> json) {
    return WaitingList(
      patientCount: json['patientCount'] as Int,
      levelOfPain: json['levelOfPain'] as Int,
      averageProcessTime: json['averageProcessTime'] as Int,
    );
  }
}
