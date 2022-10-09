import 'package:basiclayer/pages/home.dart'; //ดึงตำเเหน่งของ class homepage
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//ตั้งไม่ใหโชว เเบนเนอร debug
      title: "เเนะนำวันพีช", //ตั้งชื่อ app
      home: HomePage(),
    );
  }
}

