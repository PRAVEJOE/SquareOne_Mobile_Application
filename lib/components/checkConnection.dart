import 'dart:async' show StreamSubscription;

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class CheckConnection extends StatefulWidget {
  const CheckConnection({Key? key}) : super(key: key);

  @override
  State createState() {
    return _CheckConnection();
  }
}

class _CheckConnection extends State {
  late StreamSubscription internetConnection;
  bool isOffline = false;

  //set variable for Connectivity subscription listener

  @override
  void initState() {
    internetConnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenever connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isOffline = true;
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        setState(() {
          isOffline = false;
        });
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        setState(() {
          isOffline = false;
        });
      }
    }); // using this listener, you can get the medium of connection as well.

    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    internetConnection.cancel();
    //cancel internet connection subscription after you are done
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: errorMessage("No Internet Connection Available", isOffline),
          //to show internet connection message on isOffline = true.
        ),
      ],
    );
  }

  Widget errorMessage(String text, bool show) {
    //error message widget.
    if (show == true) {
      //if error is true then show error message box
      return Container(
        padding: const EdgeInsets.all(10.00),
        margin: const EdgeInsets.only(bottom: 10.00),
        color: Colors.red,
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 6.00),
            child: const Icon(Icons.info, color: Colors.white),
          ), // icon for error message

          Text(text, style: const TextStyle(color: Colors.white)),
          //show error message text
        ]),
      );
    } else {
      return Container();
      //if error is false, return empty container.
    }
  }
}
