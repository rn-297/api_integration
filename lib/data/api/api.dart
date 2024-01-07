import 'dart:convert';

import 'package:api_integration/data/models/my_api_data_model.dart';
import 'package:api_integration/helper/app_constants.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<MyApiData> getData(context, String url) async {
    late MyApiData data;
    try {
      final response = await http.get(
        Uri.parse(AppConstants.BASE_URL + url),
      );
      if (response.statusCode == 200) {
        final itemList = '{"MyPostsData": ${response.body}}';
        data = MyApiData.fromJson(jsonDecode(itemList));
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred' + e.toString());
    }
    return data;
  }
}
