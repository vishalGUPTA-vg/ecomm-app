import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'test.dart';
const String testDevice=' ';

class microwave extends StatefulWidget {
  @override
  _microwaveState createState() => _microwaveState( );
}

class _microwaveState extends State<microwave> {

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> microlist;
  final CollectionReference collectionReference=Firestore.instance.collection("microwave");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription=collectionReference.snapshots().listen((datasnapshot){
      setState(() {
        microlist=datasnapshot.documents;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: new Text("Aligarh Electronics"),
        ),
        body: microlist!=null?new StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: microlist.length,
          itemBuilder: (context,i){
            String imgpath=microlist[i].data['url']!=null?microlist[i].data['url']:"Not Avalible";
            String dat=microlist[i].data['name']!=null?microlist[i].data['name']:"Not Avalible";
            String price=microlist[i].data['price']!=null?microlist[i].data['price']:"Not Avalible";
            String model=microlist[i].data['model']!=null?microlist[i].data['model']:"Not Avalible";
            String detail=microlist[i].data['detail']!=null?microlist[i].data['detail']:"Not Avalible";

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
