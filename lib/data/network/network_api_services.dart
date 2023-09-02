
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/app_exception.dart';
import 'package:http/http.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';

//Api calling function with logic is written here
class NetworkApiServices extends BaseApiServices{
  @override
  Future getApi(String url) async{ //get api method
    dynamic responseJson;
   try{
     final response=await get(Uri.parse(url)).timeout(Duration(seconds: 10));
     responseJson=returnResponse(response);
     if(kDebugMode){
       print(url);
       print(responseJson);

     }

   }on SocketException{
     throw InternetException('');

   } on RequestTimeOut{
     throw RequestTimeOut('');
   }
   return responseJson;
  }

  @override
  Future postApi(data, String url) async { //post api method
    dynamic responseJson;
    if(kDebugMode){
      print(url);
      print(data);

    }
    try{
      final response=await post(Uri.parse(url),
      body: data //api is in from url encoded
      ).timeout(Duration(seconds: 10));
      responseJson= returnResponse(response);
    }
    on SocketException{
      throw InternetException('');
    }
    on RequestTimeOut{
      throw RequestTimeOut('');
    }

    if(kDebugMode){
      print(responseJson);



    }
    return responseJson;


  }

  //for checking status code
  dynamic returnResponse(Response response){
    print(response.statusCode);
    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;

      case 400:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;

      default:
        throw ApiFetchException('Error while communicating'+response.statusCode.toString());

    }

  }
  
}