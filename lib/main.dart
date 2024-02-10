import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
void main(){
  runApp(MaterialApp(
    title: 'Image Widget Example',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity
    ),
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String filePath = '';
  Future<void> checkPermission() async{
    if (await Permission.storage.request().isGranted){
      //permission Granted
      filePath='content://com.android.externalstorage.documents/document/primary%3ADownload%2FRimon.jpg';
    }else{
      //requested for permission
      await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    checkPermission();
    return Container(
      width: 300,
      height: 300,
      color: Colors.grey,
      //child: Image.network('http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcS-OZTPpZNsnOchlOMmYsSeMprn5sYU4kdOZGPL0_ksM2nHGegFrzLhGlQMBF-amQqPRFs4DzbLrI_o5gA'),
      child: Image.file(File(filePath)),
    );
  }
}
