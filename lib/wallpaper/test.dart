import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';



class fullscreen extends StatefulWidget {

  String imgpath;
  String dat,price,model,detail;
  fullscreen(this.imgpath,this.dat,this.price,this.model,this.detail);
  @override
  fullscreenState createState() => fullscreenState(this.imgpath,this.dat,this.price,this.model,this.detail);
}
// ignore: camel_case_types
class fullscreenState extends State<fullscreen> {
  static const platform = const MethodChannel('sendSms');

  Future<Null> sendSms()async {
    print("SendSMS");
    try {
      final String result = await platform.invokeMethod('send',<String,dynamic>{"phone":"+91XXXXXXXXXX","msg":"Hello! I'm sent programatically."}); //Replace a 'X' with 10 digit phone number
      print(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  String imgpath;
  String dat,price,model,detail;
  fullscreenState(this.imgpath,this.dat,this.price,this.model,this.detail);
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp  ]);
    return  new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
        leading: new IconButton(
          icon: new Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: new Text("Aligarh Electronics"),
      ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.mail),
          label: new Text("Send message \nfor enquire"),
          onPressed:() => sendSms() ,
          //child: const Text("Send SMS"),
        )
        ,body: new SingleChildScrollView(
              child:
                new Column(
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.center,
                      child: new Hero(
                        tag: imgpath,
                        child: new Image.network(imgpath),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child:
                      new Container(
                        child:
                        new Column(
                          children: <Widget>[

                            new Row(
                              children: <Widget>[
                                new Flexible(child:
                                  new Text(dat+model,style: TextStyle(color: Colors.black,fontSize: 18),),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child:
                                    new Row(
                                      children: <Widget>[
                                        new Text("Best price:",style: TextStyle(color: Colors.black,fontSize: 18)),
                                        new Text("RS:$price" ,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                            ),
                            new Row(
                              children: <Widget>[
                                Expanded(child:
                                  const Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text('Best Price',textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                                    ),
                                   )
                                ),
                                Expanded(child:
                                  const Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text('Fast Delivery',textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                                    ),
                                  )
                                )
                              ],
                            ),


  //
                          SingleChildScrollView(
                            child:
                            Container(
                              constraints: BoxConstraints(maxHeight: 700,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child:

                              WebView(
  //                              javascriptMode: JavascriptMode.restricted,
                                initialUrl: detail,
                              ),
                            ),

                          ),



                            new Row(
                              children: <Widget>[
                                new Flexible(child:
                                new Text("For furthe enquiry contact 9837162497"
                                    ,style: TextStyle(color: Colors.black,fontSize: 20),)
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                  )
                  ],
                ),
          ),
      );

  }
}
