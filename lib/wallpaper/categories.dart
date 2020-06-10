import 'package:flutter/material.dart';
import 'tv.dart';
import 'ac.dart';
import 'frige.dart';
import 'microwave.dart';
import 'ass.dart';
import 'washing.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';


// ignore: camel_case_types
class categori extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aligarh Electronics",
      home: new menu(),
    );
  }
}

// ignore: camel_case_types
class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

// ignore: camel_case_types
class _menuState extends State<menu> {
  var _connectionStatus = 'Unknown';
  var fina;
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //checking for connectivityy

    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          _connectionStatus = result.toString();
          fina=result;
          print(_connectionStatus);
          if (result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile) {
          }
        });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: new Text("Aligarh Electronics"),
      ),
      body: SingleChildScrollView(

        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Expanded(child:
                    InkWell(                                  //ac category start
                      onTap: (){
                        if (fina == ConnectivityResult.wifi || fina == ConnectivityResult.mobile) {
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ac()));

                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "No Connection",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                        );
                      }
                      },
                     child: Card(
                        child:
                        Image.asset('assets/ac.jpg',width: 150,height: 150,),
                    ),
                  )
                  ),
                  Expanded(child:
                                                     // tv category start
                    InkWell(
                      onTap: (){if (fina == ConnectivityResult.wifi ||
                          fina == ConnectivityResult.mobile) {
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new wallhome()));

                      }else{
                        Fluttertoast.showToast(
                          msg: "No Connection",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                      },
                      child: Card(child:
                        Image.asset('assets/tv.jpg',width: 150,height: 150,)
                    ),
                  )
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  Expanded(child:
                                                    //fridge category start
                    InkWell(
                      onTap: (){if (fina == ConnectivityResult.wifi ||
                          fina == ConnectivityResult.mobile) {
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new frige()));

                      }else{
                        Fluttertoast.showToast(
                          msg: "No Connection",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                      },
                      child: Card(child:
                        Image.asset('assets/frige.jpg',width: 150,height: 150,)
                    ),
                  )
                  ),
                  Expanded(child:
                                                      //washing category
                    InkWell(
                      onTap: (){if (fina == ConnectivityResult.wifi ||
                          fina == ConnectivityResult.mobile) {
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new washing()));

                      }else{
                        Fluttertoast.showToast(
                          msg: "No Connection",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                      },  child: Card(child:
                        Image.asset('assets/washing.jpg',width: 150,height: 150,)
                    ),
                  )
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                                                       //microwave category
                  Expanded(child:
                    InkWell(
                      onTap: (){if (fina == ConnectivityResult.wifi ||
                          fina == ConnectivityResult.mobile) {
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new microwave()));

                      }else{
                        Fluttertoast.showToast(
                          msg: "No Connection",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                      },  child: Card(child:
                        Image.asset('assets/microwave.jpg',width: 150,height: 150,)
                    ),
                  )
                  ),
                                                    // assecories
                  Expanded(child:
                    InkWell(
                    onTap: (){if (fina == ConnectivityResult.wifi ||
                        fina == ConnectivityResult.mobile) {
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>new ass()));

                    }else{
                      Fluttertoast.showToast(
                        msg: "No Connection",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                      );
                    }
                    },
                      child: Card(child:
                        Image.asset('assets/acce.jpg',width: 150,height: 150,)

                    ),
                  )
                  )
                ],
              ),


            ],

          ),
        )


      ),
    );
  }
}
