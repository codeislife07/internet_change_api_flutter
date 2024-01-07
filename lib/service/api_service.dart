import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internet_change_flutter/main.dart';
import 'package:internet_change_flutter/no_internet_screen.dart';

class ApiService{
  //Future<Map<String,dynamic>>
  sendRequest({
    BuildContext? context,
    required String method,
    required String url,
    dynamic bodyParameter
    }) async {

    //check connection and show no internet screen if device is not connected with any network data/wifi
    final connectivityResult = await (Connectivity().checkConnectivity());
    dynamic data() async {
      var data=await Navigator.push(globalKey.currentContext!, MaterialPageRoute(builder: (_)=>NoInternetScreen()));
      if(data==true){
        return sendRequest(method: method, url: url);
      }
    }
    if(connectivityResult==ConnectivityResult.none){
      return data();
    }

    http.Response? response;
   try{
     switch(method){
       case "get":
         response=await http.get(Uri.parse(url));
         break;
       default:
         break;
     }
   }catch(e){
     print("Exception ${e}");
   }

    if(response==null){
      //api not call due to poor network connection
     return data();
    }
    switch(response?.statusCode??0){
      case 200:
        return jsonDecode(response!.body);
        // break;
      default:
        break;
    }

    return {};
  }

}