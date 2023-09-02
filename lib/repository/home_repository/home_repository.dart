import 'package:flutter/cupertino.dart';
import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/model/home/user_list_model.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class HomeRepository {
  final apiServices = NetworkApiServices();

  Future<UserListModel> userApi() async {
    final response = await apiServices.getApi(AppUrl.userListUrl);
    return UserListModel.fromJson(response);
  }
}
