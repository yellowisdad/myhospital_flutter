import 'package:myhospital/model/hospital.dart';
import 'package:myhospital/model/services/base_service.dart';
import 'package:myhospital/model/services/hospital_service.dart';

class HospitalRepository {
  final BaseService _mediaService = HospitalService();

  Future<List<Hospital>> fetchList() async {
    dynamic response = await _mediaService.getResponse();
    final jsonData = response['hospitals'] as List;
    List<Hospital> hospitalList =
        jsonData.map((tagJson) => Hospital.fromJson(tagJson)).toList();

    return hospitalList;
  }
}
