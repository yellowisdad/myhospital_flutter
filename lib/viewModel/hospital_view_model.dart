import 'package:flutter/foundation.dart';
import 'package:myhospital/model/hospital.dart';
import 'package:myhospital/model/apis/api_response.dart';
import 'package:myhospital/model/hospital_repository.dart';

class HospitalViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  Hospital? _hospital;

  ApiResponse get response {
    return _apiResponse;
  }

  Hospital? get hospital {
    return _hospital;
  }

  Future<void> fetchData() async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      List<Hospital> dataList = await HospitalRepository().fetchList();
      _apiResponse = ApiResponse.completed(dataList);
      /*
      if (kDebugMode) {
        print('HospitalViewModel--------------');
        print(dataList[0].name);
      }
      */
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      if (kDebugMode) {
        print(e);
      }
    }
    notifyListeners();
  }

  void setSelectedHotpital(Hospital? hospital) {
    _hospital = hospital;
    // notifyListeners();
  }
}
