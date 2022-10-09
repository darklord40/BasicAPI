
import 'dart:convert'; //pageage เกี่ยวกับการแปลงไฟล 

import 'package:basiclayer/pages/detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //เรียก Scaffold
        appBar: AppBar(
          title: Text("เเอพความรู้เกี่ยวกับวันพีช"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          //FutureBuilder 
          child: FutureBuilder( builder: (context, snapshot) { //snapshot ข้อมูลที่ได้จาก future:
          /*
          data
          */ 
            var data = json.decode(snapshot.data.toString()); //convert จาก json เปนข้อความ
            return ListView.builder( //ListView.builder มีข้อมุล list อยุ่ชุดนึง เเยกเปนชุดๆ
             //สร้าง item มาจากฟันกชัน itemBuilder โดยการ loop 
              itemBuilder:(BuildContext context , int index){ 
                
                  return MyBox(data[index]['title'],data[index]['subtitle']
                   ,data[index]['image_url'],data[index]['detail']);
              

              },
              
              itemCount: data.length,); //data.length จำนวนdata


          },
          //โหลห json ที่มาของข้อมูล
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),//

          )
        ),

    );
  }


  //สร้างวิจเจท อารมณ์คล้ายๆ ฟังกชัน
  Widget MyBox(String title, String subtitle, String url , String detail){  //(String title) มีการกรอกค่า
  var v1,v2,v3,v4;
  v1 = title;
  v2 = subtitle;
  v3 = url;
  v4 = detail;
    return Container(
      //ข้างใน container
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20), //ตั้งค่า padding
      //color:Colors.blue[50], //ใส่สีลงในเเถว
      height: 210,//ตั้งค่าความสูง
      decoration: BoxDecoration( //ตัตกเเต่งกรอบให้โค้งๆ
        //color: Colors.blue[50],
        image:DecorationImage(image: NetworkImage(url),
        fit: BoxFit.cover, //ตั้งค่าในรูปภาพพื้นหลังให่เท่ากรอบ
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.40),BlendMode.darken) //set ระดับสีของพื้นหลัง
        ),
        borderRadius: BorderRadius.circular(20)
        ),
      child: Column(
        

        mainAxisAlignment:MainAxisAlignment.start, // start บนสุด center กลาง endทำให้ข้อตวามอยุ่ล่างสุด ในเเนวเเกนy
        crossAxisAlignment: CrossAxisAlignment.start,//ทำให้วิจเจจ อยุ่ด้านซ้ายสุด ถ้า end อยุ่ขวาสุด center ตรงกลาง ใน้้้้เเนวเเกน x
        children: [
          Text(title,style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Text(subtitle,style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          TextButton(onPressed: (){
             
             Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(v1,v2,v3,v4))); //ใส่พารามิเตอร์ใน DetailPage
          }, child: Text("อ่านต่อ"))
        ],
      ),
    ); 
  }
//flutter clean เคลียไฟล เก็บไว้เเคไฟลโปรเจค

/*

  Widget MyBox(String title){  
    return Container(
      //ข้างใน container
      padding: EdgeInsets.all(20), //ตั้งค่า padding
      //color:Colors.blue[50], //ใส่สีลงในเเถว
      height: 150,//ตั้งค่าความสูง
      decoration: BoxDecoration( //ตัตกเเต่งกรอบให้โค้งๆ
        //color: Colors.blue[50],
        image:DecorationImage(image: NetworkImage("https://thestandard.co/wp-content/uploads/2021/10/One-Piece.jpg"),
        fit: BoxFit.cover, //ตั้งค่าในรูปภาพพื้นหลังให่เท่ากรอบ
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.15),BlendMode.darken) //set ระดับสีของพื้นหลัง
        ),
        borderRadius: BorderRadius.circular(20)
        ),
      child: Column(
        

        mainAxisAlignment:MainAxisAlignment.start, // start บนสุด center กลาง endทำให้ข้อตวามอยุ่ล่างสุด ในเเนวเเกนy
        crossAxisAlignment: CrossAxisAlignment.start,//ทำให้วิจเจจ อยุ่ด้านซ้ายสุด ถ้า end อยุ่ขวาสุด center ตรงกลาง ใน้้้้เเนวเเกน x
        children: [
          Text("ลูฟี่",style: TextStyle(fontSize: 25,color: Colors.black, fontWeight: FontWeight.bold)),
          SizedBox(height: 20,),
          Text("ตัวละครพระเอกขั้นเทพ ใช้ผลหมัดยางยืด",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
        ],
      ),
    ); 
  }
*/
}
//2.34