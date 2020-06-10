import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'test.dart';
const String testDevice=' ';

class washing extends StatefulWidget {
  @override
  _washingState createState() => _washingState( );
}

class _washingState extends State<washing> {

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> washinglist;
  final CollectionReference collectionReference=Firestore.instance.collection("washing");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription=collectionReference.snapshots().listen((datasnapshot){
      setState(() {
        washinglist=datasnapshot.documents;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: new Text("Aligarh Electronics"),
        ),
        body: washinglist!=null?new StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: washinglist.length,
          itemBuilder: (context,i){
            String imgpath=washinglist[i].data['url']!=null?washinglist[i].data['url']:"Not Avalible";
            String dat=washinglist[i].data['name']!=null?washinglist[i].data['name']:"Not Avalible";
            String price=washinglist[i].data['price']!=null?washinglist[i].data['price']:"Not Avalible";
            String model=washinglist[i].data['model']!=null?washinglist[i].data['model']:"Not Avalible";
            String detail=washinglist[i].data['detail']!=null?washinglist[i].data['detail']:"Not Avalible";

            return new Material(
              elevation: 8.0,
              borderRadius: BorderRadius.all(new Radius.circular(8.0)),
              child: new InkWell(
                onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>new fullscreen(imgpath,dat,price,model,detail) ));},
                child: Hero(
                  tag: imgpath,
                  child: new FadeInImage(
                    image:new NetworkImage(imgpath),
                    fit: BoxFit.cover,
                    placeholder:
                    new AssetImage("assets/logo.jpeg")
                    ,),
                ),
              ),
            );
          },
          staggeredTileBuilder: (i)=>new StaggeredTile.count(2, i.isEven?2:3),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ):new Center(
          child: new CircularProgressIndicator(),
        )
    );
  }
}
