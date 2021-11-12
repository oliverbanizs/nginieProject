import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nginie/model/api/api_status.dart';
import 'package:nginie/model/models/Activity.dart';
import 'package:nginie/utils/constants.dart';

class ActivityRepository {
  static Future<Object> getActivity() async {
    try {
      var response = await http.get(Uri.parse(baseUrl + fetchActivityData));
      if (SUCCESS == response.statusCode) {
        return Success(
            code: SUCCESS, response: activityFromJson(response.body));
      }
      return Failure(code: INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
