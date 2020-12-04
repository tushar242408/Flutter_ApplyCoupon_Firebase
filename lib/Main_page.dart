import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Add_data.dart';
import 'main.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blueGrey,
        centerTitle: true,
        title:Row(children: [Text("Shopping",style:TextStyle(color:Colors.black)),Text(" Cart",style:TextStyle(color:Colors.white))],),


      ),
      body: Container(
        child: Stack(children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.network("https://media1.popsugar-assets.com/files/thumbor/8xugn8tUReUIM-P_T8bkjdhe0xc/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2019/06/05/869/n/43879538/e754d6485cf81d3d31bd40.89484858_/i/Dark-Sides-Zodiac-Signs.jpg",fit:BoxFit.cover)),












              Positioned(
                bottom: 20,
                left: 20,
                child: GestureDetector(
                  onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp())),
                  child: Container(
                    padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.blueGrey,
  ),
  child:Text("Search",style:TextStyle(fontSize:30)),
),
                ),
              ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=> Add())),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child:Text("Add data",style:TextStyle(fontSize:30)),
              ),
            ),
          ),

        ],
        ),
      
      ),
      
      
    );
  }
}
