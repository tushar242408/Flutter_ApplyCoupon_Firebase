import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellocoupan/Main_page.dart';

import 'Add_data.dart';
import 'Coupan_List.dart';
import 'Coupan_View.dart';



void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Main()));
}

class MyApp extends StatefulWidget {
  String Coupan;
  String Data;
  int Discount;
  var date;
  MyApp({this.Coupan="",this.Data="",this.Discount=0,this.date});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static int Discount1=0;
  String TypeCoupan;
  int amount=0,f=0;

  int k=0;
  Select(){

    var date1=DateTime.now();

    var date2=DateTime.parse(widget.date);

    if(date1.year<=date2.year && date1.month<=date2.month && date1.day<=date2.day && date1.hour<=date2.hour ){
      widget.Discount=widget.Discount;
      setState(() {
        k=10;
      });
    }
  if(k==0){
    widget.Discount=0;
  k=4;
  }
  }


  hel(){
    List<Models> a;
    Data b=Data();

    a=b.getdata();

    var date1=DateTime.now();




print(TypeCoupan.toLowerCase());

    for(int i=0;i<a.length;i++){
      k=0;
      var date2=DateTime.parse(a[i].Coupdate);
      print(a[i].Coupdate);
      print(a[i].Coupname.toLowerCase());
      if(TypeCoupan.toLowerCase()==a[i].Coupname.toLowerCase()){
        setState(() {k=1;});
      }
      print(date2.compareTo(date1));
      print(k);
      if(date2.compareTo(date1)>0 && k==1){
        widget.Discount=a[i].Coupandiscount;
        setState(() {
          k=10;
        });
        break;
      }
    }
    print(k);
    if(k==1 || k==0){
      k=4;
    }

  }

  @override
  void initState() {

    setState(() {

    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blueGrey,
        centerTitle: true,
        title:Row(children: [Text("Shopping",style:TextStyle(color:Colors.black)),Text(" Cart",style:TextStyle(color:Colors.white))],),
      ),
      body:SingleChildScrollView(
        child: Container(
          child:Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/4,
                child:Image.network('https://www.graphicsprings.com/filestorage/stencils/dd2712afdf9dc36c4d4419792f62bf47.png?'),
              ),

              TextFormField(
                keyboardType: TextInputType.phone,
               initialValue:Discount1!=0? "$Discount1":"",
                decoration: InputDecoration(

                  hintText:"Amount",

                ),
                onChanged:((value){
                  setState(() {

                    amount = int.parse(value);
                    Discount1=int.parse(value);
                  });
                }),

              ),

              SizedBox(height:20),
              TextFormField(
                keyboardType: TextInputType.name,
                initialValue:"${widget.Coupan}",
                  decoration: InputDecoration(
                    hintText:"Write Coupan",

                  ),

                onChanged:((value){
                  setState(() {
                    f=1;
                    TypeCoupan=value;
                  });

                }),

              ),

              GestureDetector(child: Text("Select coupans",textAlign: TextAlign.end,style: TextStyle(color:Colors.blueAccent,fontSize:20),),
              onTap:(){

                Navigator.push(context, MaterialPageRoute(builder: (context)=> View11()));

              print("hello234");}),

           SizedBox(height:30),
              GestureDetector(
                  onTap:(){
                         print(widget.date);
                    if(TypeCoupan!=null){
                      hel();

                    }
                    else{
                      Select();


                    }

                  if(k==0){
                   setState(() { widget.Discount=0;});
                    AlertDialog dialog=AlertDialog(
                      content: new Text("Wrong Coupan!"),
                    );
                    showDialog(context:context,child:dialog);
                  }
                  if(k==4){
                    setState(() { widget.Discount=0;});
                    AlertDialog dialog=AlertDialog(
                      content: new Text("Expired!"),
                    );
                    showDialog(context:context,child:dialog);
                  }
                  ;
                  k=0;},
                child: Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color:Colors.blueGrey,
                  ),

                  width: MediaQuery.of(context).size.width/3.2,
                  height: MediaQuery.of(context).size.height/12,
                  child: Text("Apply",textAlign:TextAlign.center,style:TextStyle(fontSize:30)),
                ),
              ),
              SizedBox(height:30),

              Container(

                child: Column(
                  children: [
                    Row(children: [ Text("Total Amount:-",style:TextStyle(fontSize:25,color:Colors.redAccent)),Text(":${Discount1}",style:TextStyle(fontSize:18,color:Colors.black87))],),
                    SizedBox(height:1,child:Container(color:Colors.black)),
                    Row(children: [ Text("Discount:-",style:TextStyle(fontSize:18,color:Colors.redAccent)),Text("${widget.Discount}",style:TextStyle(fontSize:18,color:Colors.black87))],),
                    Row(children: [ Text("Amount Deducted:-",style:TextStyle(fontSize:25,color:Colors.redAccent)),Text(":${(Discount1*widget.Discount/100)}",style:TextStyle(fontSize:18,color:Colors.black87))],),
                    SizedBox(height:1,child:Container(color:Colors.black)),
                    Row(children: [ Text("Amount Payblye:-",style:TextStyle(fontSize:25,color:Colors.redAccent)),Text(":${Discount1-(Discount1*widget.Discount/100)}",style:TextStyle(fontSize:18,color:Colors.black87))],),
                  ],
                ),
              ),

            ],

          )
        ),
      )
    );
  }
}
