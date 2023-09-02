import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/model/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final api = HomeRepository();
  final requestStatus=Status.LOADING.obs;
  final userList=UserListModel().obs;
  RxString error="".obs;

  void setRequestStatus(Status value){ //for condition in main home view switch case
    requestStatus.value=value;
  }

  void setUserList(UserListModel model){
    userList.value=model;
  }
  void setError(String value){
    error.value=value;
  }


  void userListApi() {

    api.userApi().then((value) {
      setRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);

    }).onError((error, stackTrace) {
      setError(error.toString());
      setRequestStatus(Status.ERROR);

  });


  }
  void refreshApi() {
    setRequestStatus(Status.LOADING); //for showing progress bar
    api.userApi().then((value) {
      setRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);

    }).onError((error, stackTrace) {
      setError(error.toString());
      setRequestStatus(Status.ERROR);

    });


  }
}
