import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'fire.dart';
import 'main.dart';
class Add extends StatefulWidget {
  var a;
  Add({this.a=""});
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {


  Adddata()async{
    Database db1=new Database();


var c=0;

    var date=DateTime.now();
    if(date.hour+d>24){
      d=date.hour+d-24;c=1;
    }

print(date);
     var newdate=new DateTime(date.year,date.month,date.day+c,date.hour+d,date.minute,date.second);



    Map<String,dynamic> l={
    "Coupname": name,"Copdata":data,
    "Coupdate": "${newdate.toString()}",
    "Coupandiscount":Discount

    };

   await db1.addTask(l);




  }




  String name,data;
  int Discount,d;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blueGrey,
        centerTitle: true,
        title:Row(children: [Text("Shopping",style:TextStyle(color:Colors.black)),Text(" Cart",style:TextStyle(color:Colors.white))],),


      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          child: Column(
            children: [

    TextFormField(
      keyboardType: TextInputType.name,
    decoration: InputDecoration(
    fillColor: Colors.white,
    focusColor: Colors.white,
    hintText: "Enter Coupan Name",
    ),
        onChanged:((value){
          setState(() {
            name = value;
          });
        })
    ),SizedBox(height: MediaQuery.of(context).size.height*0.02,),
 TextFormField(keyboardType: TextInputType.name,
    decoration: InputDecoration(
    fillColor: Colors.white,
    focusColor: Colors.white,
    hintText: "Enter Data",),
     onChanged:((value){
       setState(() {
         data = value;
       });
     })
    ),


              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              TextFormField(keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: "Discount",
                  ),
                  onChanged:((value){
                    setState(() {
                      Discount = int.parse(value);
                    });
                  })
              ),SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              TextFormField(keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "HH",
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: "How Much Hour your coupan will Valid",),
                  onChanged:((value){
                    setState(() {
                      d = int.parse(value);
                    });
                  })
              ),

              SizedBox(height: MediaQuery.of(context).size.height/5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  if(name!=null && data!=null && Discount!=null && d!=null) {
                    Adddata();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Add(a:"Your Data Is Added")));
                  }else{
                    AlertDialog dialog=AlertDialog(
                      content: new Text("please input all field"),
                    );
                    showDialog(context:context,child:dialog);
                  }

                 },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child:Text("Add Data",style:TextStyle(fontSize:30)),
                ),
              ),
              GestureDetector(

                onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp())),
                child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey,
                      ),
                      child:Text("View data",style:TextStyle(fontSize:30)),
                    ),
              ),
            ],
          ),

              SizedBox(height: 20),
              Text("${widget.a}",style:TextStyle(fontSize:18,color:Colors.greenAccent)),
        ]),


        ),
      ));
  }
}
