import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Coupan_List.dart';


class Database{
  final DocumentReference documentReference= Firestore.instance.collection("mydata").document();

 addTask(Map<String , dynamic> row) async {
  // print(row);
    await documentReference.setData(row).whenComplete(() => print("done"));
  }



}
