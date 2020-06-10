import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'test.dart';
const String testDevice=' ';

class ass extends StatefulWidget {
  @override
  _assState createState() => _assState( );
}

class _assState extends State<ass> {

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> ass;
  final CollectionReference collectionReference=Firestore.instance.collection("ass");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription=collectionReference.snapshots().listen((datasnapshot){
      setState(() {
        ass=datasnapshot.documents;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: new Text("Aligarh Electronics"),
        ),
        body: ass!=null?new StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: ass.length,
          itemBuilder: (context,i){
            String imgpath=ass[i].data['url']!=null?ass[i].data['url']:"Not Avalible";
            String dat=ass[i].data['name']!=null?ass[i].data['name']:"Not Avalible";
            String price=ass[i].data['price']!=null?ass[i].data['price']:"Not Avalible";
            String model=ass[i].data['model']!=null?ass[i].data['model']:"Not Avalible";
            String detail=ass[i].data['detail']!=null?ass[i].data['detail']:"Not Avalible";

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
