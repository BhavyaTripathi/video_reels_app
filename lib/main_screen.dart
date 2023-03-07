
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:video_reels_app/model_class.dart';
import 'package:video_reels_app/request_class.dart';
import 'package:video_reels_app/video_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Data>? data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    RequestClass().fetchData().then((value) {
      data = value.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            if(data == null){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Error fetching data!"),
              ));
            }
            else{
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoScreen(data)));
            }
          },
          child: SizedBox(
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   <Widget>[
                Icon(EvaIcons.film),
                Text("Reels", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}