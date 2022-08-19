import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/widgets/custom%20text.dart';

import '../models/task.dart';

class Notification_screen extends StatelessWidget {
  Task task;
  Notification_screen ({required this.task});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(task.color!).withOpacity(.5),
     // appBar: AppBar(),
      body:SafeArea(
        child:  Column(
          children: [
            SizedBox(height: 10,),
Row(children: [

  IconButton(onPressed:(){Get.back();}, icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,)),
  SizedBox(width:60,),
  Custom_text(text: "Hello,My friend",titel:true,color:Colors.white,),

],),

            Center(child: Custom_text(text: "You have a new task now",titel:false, color: Colors.grey,)),
            SizedBox( height:30),

            Expanded(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 3,
                    offset: Offset(3, 5), // Shadow position
                  ),
                ],
                    color: Color(task.color!).withOpacity(.9),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(80), )
                ),
                width: double.infinity,


                child:
                Column(

                  children: [
 SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.text_format_outlined,size: 40,color: Colors.white),
                        Custom_text(text: "Titel ",titel:true,color: Colors.white,),],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Custom_text(text: task.title!,titel:false,color: Colors.grey, ),],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.description_outlined,size: 35,color: Colors.white),
                        Custom_text(text: " Description",titel:true,color: Colors.white,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Custom_text(text: task.note!,titel:false,color: Colors.grey),],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.date_range,size: 35,color:Colors.white,),    Custom_text(text: " Date",titel:true,color: Colors.white)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Custom_text(text: task.data!,titel:false,color: Colors.grey),],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.timelapse,size: 35,color:Colors.white,),    Custom_text(text: "StartTime",titel:true,color: Colors.white)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Custom_text(text: task.startTime!,titel:false,color: Colors.grey),],
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.timelapse_outlined,size: 35,color:Colors.white,),    Custom_text(text: "EndTime",titel:true,color: Colors.white)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Custom_text(text: task.endTime!,titel:false,color: Colors.grey),],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

