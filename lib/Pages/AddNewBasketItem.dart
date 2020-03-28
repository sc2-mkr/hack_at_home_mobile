import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hackathome/Utility/Basket.dart';
import 'package:hackathome/Utility/BasketItem.dart';
import 'package:hackathome/Utility/Drawer.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';
import 'package:hackathome/Utility/Theme.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';
import 'Camera.dart';

class AddNewBasketItem extends StatefulWidget {

  @override
  AddNewBasketItemState createState() => AddNewBasketItemState();
}

class AddNewBasketItemState extends State<AddNewBasketItem> {
  String name = "";
  String path;

  @override
  Widget build(BuildContext context) {
    return StatusBarCleaner(
        color: SC2Theme.darkmainColor,
        child: Scaffold(
          backgroundColor: SC2Theme.backgroundColor,
          appBar: AppBar(title: Text(MyApp().title),),
          drawer: getDrawer(),
          body: getBody(context),
        )
    );
  }

  getBody(context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Scrivi cosa vuoi acquistare", style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32),
                child: TextField(
                  onChanged: (text) {
                    name = text;
                  },
                  decoration: InputDecoration(
                      hintText: 'Nome del prodotto'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("se vuoi per maggiore chiarezza \n scatta una foto",
                    style: TextStyle(fontSize: 20,), textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: InkWell(
                    onTap: () {
                      _asyncCamera(context);
                    },
                    child: path != null ? CircleAvatar(
                      backgroundImage: FileImage(File(path)),
                      child: Icon(Icons.camera_alt, size: 60,),
                    ) :
                    CircleAvatar(
                      backgroundColor: SC2Theme.mainColor,
                      child: Icon(Icons.camera_alt, size: 60,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: RaisedButton(
                color: SC2Theme.mainColor,
                child: Text("AGGIUNGI",
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                onPressed: () {
                  if (name != "") {
                    Basket.addEntries(BasketItem(name: name, imagePath: path));
                    Navigator.pop(context, "OK");
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _asyncCamera(context) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(camera: firstCamera,),
      ),
    ).then((value){setState(() {
      path = value;
    });});
  }
}