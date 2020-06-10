import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'test.dart';
const String testDevice=' ';

class wallhome extends StatefulWidget {
  @override
  _wallhomeState createState() => _wallhomeState( );
}

class _wallhomeState extends State<wallhome> {

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpaperlist;
  final CollectionReference collectionReference=Firestore.instance.collection("wallpaper");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     subscription=collectionReference.snapshots().listen((datasnapshot){
       setState(() {
         wallpaperlist=datasnapshot.documents;
       });
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: new Text("Aligarh Electronics"),
      ),
      body: wallpaperlist!=null?new StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: wallpaperlist.length,
         itemBuilder: (context,i){
          String imgpath=wallpaperlist[i].data['url']!=null?wallpaperlist[i].data['url']:"Not Avalible";
          String dat=wallpaperlist[i].data['name']!=null?wallpaperlist[i].data['name']:"Not Avalible";
          String price=wallpaperlist[i].data['price']!=null?wallpaperlist[i].data['price']:"Not Avalible";
          String model=wallpaperlist[i].data['model']!=null?wallpaperlist[i].data['model']:"Not Avalible";
          String detail=wallpaperlist[i].data['detail']!=null?wallpaperlist[i].data['detail']:"Not Avalible";

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
