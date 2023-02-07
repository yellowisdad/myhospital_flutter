class WaitingList {
  final int patientCount;
  final int levelOfPain;
  final int averageProcessTime;

  WaitingList(
      {required this.patientCount,
      required this.levelOfPain,
      required this.averageProcessTime});

  factory WaitingList.fromJson(Map<String, dynamic> json) {
    return WaitingList(
      patientCount: json['patientCount'] as int,
      levelOfPain: json['levelOfPain'] as int,
      averageProcessTime: json['averageProcessTime'] as int,
    );
  }
}
