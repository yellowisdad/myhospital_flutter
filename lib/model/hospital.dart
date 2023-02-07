import 'package:myhospital/model/location.dart';
// import 'package:myhospital/model/waitinglist.dart';

class Hospital {
  final int id;
  final String name;
  final List<dynamic>? waitingList;
  final Location location;

  Hospital(
      {required this.id,
      required this.name,
      this.waitingList,
      required this.location});

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['id'] as int,
      name: json['name'] as String,
      waitingList: json['waitingList'],
      location: Location.fromJson((json['location'])),
    );
  }
}
