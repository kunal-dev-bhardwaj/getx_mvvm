import 'package:flutter/material.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/components/internetexception_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/user_preference/UserPreference.dart';
import 'package:get/get.dart';
import '../../view_model/controller/home/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreference preference=UserPreference();
  final controller=Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            preference.removeUser().then((value) {
              Get.offNamed(RoutesName.loginView);
            });

          }, icon: Icon(
            Icons.logout
          ))
        ],

      ),
      body: Obx(() {
        switch(controller.requestStatus.value){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if(controller.error.value=="No internet"){
              return InternetExceptionWidget(onpress: () {
                controller.refreshApi();
              });
            }else{
               return Center(child: Text(controller.error.toString()));
            }

          case Status.COMPLETED:
            return ListView.builder(
                itemCount: controller.userList.value.data!.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(controller.userList.value.data![index].avatar.toString()),
                      ),
                      title: Text(controller.userList.value.data![index].firstName.toString()),
                      subtitle: Text(controller.userList.value.data![index].email.toString()),

                    ),
                  );


                });
            

        }


      })

    );
  }
}
