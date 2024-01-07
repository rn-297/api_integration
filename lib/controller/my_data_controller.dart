
import 'package:api_integration/data/api/api.dart';
import 'package:api_integration/data/models/my_api_data_model.dart';
import 'package:api_integration/helper/app_constants.dart';
import 'package:flutter/material.dart';

class MyDataController extends ChangeNotifier {
  late List<MyPostsData> data;
  bool loading=true;
  Services services =Services();

  getPostsData(context)async{
    loading=true;
    MyApiData apiData = await services.getData(context, AppConstants.POSTS);
    loading=false;
    data = apiData.myPostsData!;
  }

}
