import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckConnection extends StatefulWidget{
  @override
  State createState() {
    return _CheckConnection();
  }
}

class _CheckConnection extends State{
  late StreamSubscription internetconnection;
  bool isoffline = false;
  //set variable for Connectivity subscription listiner

  @override
  void initState() {
    internetconnection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if(result == ConnectivityResult.none){
        //there is no any connection
        setState(() {
          isoffline = true;
        });
      }else if(result == ConnectivityResult.mobile){
        //connection is mobile data network
        setState(() {
          isoffline = false;
        });
      }else if(result == ConnectivityResult.wifi){
        //connection is from wifi
        setState(() {
          isoffline = false;
        });
      }
    }); // using this listiner, you can get the medium of connection as well.

    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    internetconnection.cancel();
    //cancel internent connection subscription after you are done
  }

  @override
  Widget build(BuildContext context) {
    return  Column(children: [

              Container(
                child: errmsg("No Internet Connection Available", isoffline),
                //to show internet connection message on isoffline = true.
              ),
            ],);
  }

  Widget errmsg(String text,bool show){
    //error message widget.
    if(show == true){
      //if error is true then show error message box
      return Container(
        padding: EdgeInsets.all(10.00),
        margin: EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [

          Container(
            margin: EdgeInsets.only(right:6.00),
            child: Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text(text, style: TextStyle(color: Colors.white)),
          //show error message text
        ]),
      );
    }else{
      return Container();
      //if error is false, return empty container.
    }
  }
}