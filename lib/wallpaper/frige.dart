import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'test.dart';
const String testDevice=' ';

class frige extends StatefulWidget {
  @override
  _frigeState createState() => _frigeState( );
}

class _frigeState extends State<frige> {

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> frigelist;
  final CollectionReference collectionReference=Firestore.instance.collection("fridge");



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription=collectionReference.snapshots().listen((datasnapshot){
      setState(() {
        frigelist=datasnapshot.documents;
      });
    });
  }

  @override
//  void dispose() {
//  _bannerAd?.dispose();
//  _interstitialAd.dispose();
//    // TODO: implement dispose
//    subscription?.cancel();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: new Text("Aligarh Electronics"),
        ),
        body: frigelist!=null?new StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: frigelist.length,
          itemBuilder: (context,i){
            String imgpath=frigelist[i].data['url']!=null?frigelist[i].data['url']:"Not Avalible";
            String dat=frigelist[i].data['name']!=null?frigelist[i].data['name']:"Not Avalible";
            String price=frigelist[i].data['price']!=null?frigelist[i].data['price']:"Not Avalible";
            String model=frigelist[i].data['model']!=null?frigelist[i].data['model']:"Not Avalible";
            String detail=frigelist[i].data['detail']!=null?frigelist[i].data['detail']:"Not Avalible";

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
