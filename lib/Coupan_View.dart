import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';


class View11 extends StatefulWidget {
  @override
  _View11State createState() => _View11State();
}

class _View11State extends State<View11> {
var a;
  @override
  geta()async{
    print("3");
    var b=Firestore.instance.collection("mydata");
    var c=Firestore.instance.collection("mydata").document();
    setState(() {
      print("4");


      a=b;
print(a);
      print(c);
    });
  }
  void initState() {
     print("1");
geta();
     print("2");




    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.blueGrey,
        title:Text("Coupans"),
      ),
      body:StreamBuilder(
          stream: Firestore.instance.collection("mydata").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index) {
                  return Container(child: SingleChildScrollView(

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async{
                         //   MyApp c=MyApp();


                         Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp(Coupan: snapshot.data.documents[index]['Coupname'],Discount:snapshot.data.documents[index]['Coupandiscount'],date:snapshot.data.documents[index]['Coupdate'])));

                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color:Colors.white70,
                            child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("CoupanName:${snapshot.data.documents[index]['Coupname']}",style:TextStyle(
                                  fontSize: 28,
                                )),
                                Text("Dicount:${snapshot.data.documents[index]['Coupandiscount']}",style:TextStyle(
                                  fontSize: 28,
                                )),
                                Text("Validtill:${snapshot.data.documents[index]['Coupdate']}",style:TextStyle(
                                  fontSize: 18,
                                ))
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 10,child:Container(color: Colors.black12,),)
                      ],
                    ),
                  )
                    ,);
                });
          }
      ),
    );
  }
}




