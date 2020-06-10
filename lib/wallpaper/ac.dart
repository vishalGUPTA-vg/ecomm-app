import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'test.dart';
const String testDevice=' ';

class ac extends StatefulWidget {
  @override
  _acState createState() => _acState( );
}

class _acState extends State<ac> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> aclist;
  final CollectionReference collectionReference=Firestore.instance.collection("Ac");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription=collectionReference.snapshots().listen((datasnapshot){
      setState(() {
        aclist=datasnapshot.documents;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: new Text("Aligarh Electronics"),
        ),
        body: aclist!=null?new StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: aclist.length,
          itemBuilder: (context,i){
            String imgpath=aclist[i].data['url']!=null?aclist[i].data['url']:"Not Avalible";
            String dat=aclist[i].data['name']!=null?aclist[i].data['name']:"Not Avalible";
            String price=aclist[i].data['price']!=null?aclist[i].data['price']:"Not Avalible";
            String model=aclist[i].data['model']!=null?aclist[i].data['model']:"Not Avalible";
            String detail=aclist[i].data['detail']!=null?aclist[i].data['detail']:"Not Avalible";

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
