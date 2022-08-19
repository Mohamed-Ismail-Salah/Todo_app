
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:todo/widgets/Task_Tile.dart';
import 'package:todo/widgets/custom%20text.dart';
import 'package:todo/widgets/custom_imge.dart';

import '../controller/task_controller.dart';
import '../service/theme_service.dart';
import 'package:get/get.dart';


import 'addTask.dart';

class Home extends StatefulWidget{
  @override

  State<Home> createState() => _HomeState();
}
DateTime selectedDate = DateTime.now();
class _HomeState extends State<Home> {


  final TaskController taskController =Get.put(TaskController());

  Icon iconthem=Icon( Icons.nightlight_round);
  @override
  void initState() {
    super.initState();
    taskController.getTask();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.purple,
leading:IconButton(
  onPressed: (){

  ThemeService().swithchTheme();

  setState(() {
    if(Get.isDarkMode)
    {iconthem=Icon(Icons.wb_sunny);}
    else{iconthem=Icon( Icons.nightlight_round);}
  });
  },
  icon:iconthem,
),
     ),
body:   Column(
  children: [
    SizedBox(
      height: 10,
    ),
    Custom_text(text: "${ DateFormat.yMMMMd().format(DateTime.now())}",
        titel:false
    ,color: Colors.grey,
      size: 30,
    ),
    SizedBox(
      height: 10,
    ),
     DatePicker(

       DateTime.now(),
       width: 70,
       height: 100,

       initialSelectedDate: DateTime.now(),
    selectionColor: Colors.purple,
    selectedTextColor: Colors.white,
deactivatedColor: Colors.grey,
    dateTextStyle: TextStyle(
      color: Colors.grey,
      fontSize: 25
    ),
    onDateChange: (newDate) {

    setState(() {
      selectedDate = newDate;
    });}

     ,dayTextStyle: TextStyle(color: Colors.grey),
       monthTextStyle: TextStyle(color: Colors.grey),
     )
   ,  SizedBox(
     height: 10,
   ),

    getBody()




  ],
),




     floatingActionButton: FloatingActionButton(
       onPressed: ()async {

        await Get.to(()=>AddTask());
        taskController.getTask();
       },
       backgroundColor: Colors.purple,
       child: const Icon(Icons.add),
     ),

   );
  }
Widget getBody(){
    if(taskController.taskllist.isEmpty){
     return Custom_Iamge();
  }else{
      return Task_Tile (selectedDate: selectedDate,);
   }
 }
}

