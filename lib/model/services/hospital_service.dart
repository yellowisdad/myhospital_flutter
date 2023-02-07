import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myhospital/model/apis/app_exception.dart';
import 'package:myhospital/model/services/base_service.dart';

class HospitalService extends BaseService {
  @override
  Future getResponse() async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(mediaBaseUrl));
      responseJson = returnResponse(response);
      final record = responseJson['record'];
      responseJson = record['hospitals'];
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            // ignore: prefer_adjacent_string_concatenation
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
